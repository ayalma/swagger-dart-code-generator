import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:swagger_dart_code_generator/src/extensions/file_name_extensions.dart';
import 'package:swagger_dart_code_generator/src/models/generator_options.dart';
import 'package:swagger_dart_code_generator/src/swagger_code_generator.dart';
import 'package:universal_io/io.dart';
import 'package:dart_style/dart_style.dart';
import 'package:path/path.dart' show join, normalize;

///Returns instance of SwaggerDartCodeGenerator
SwaggerDartCodeGenerator swaggerCodeBuilder(BuilderOptions options) =>
    SwaggerDartCodeGenerator(options);

const _inputFileExtensions = ['.swagger', '.json'];

const String _outputFileExtension = '.swagger.dart';
const String _outputEnumsFileExtension = '.enums.swagger.dart';
const String _outputModelsFileExtension = '.models.swagger.dart';
const String _outputResponsesFileExtension = '.responses.swagger.dart';
const String _indexFileName = 'client_index.dart';
const String _mappingFileName = 'client_mapping.dart';

String normal(String path) {
  return AssetId('', path).path;
}

Map<String, List<String>> _generateExtensions(GeneratorOptions options) {
  final filesList = Directory(normalize(options.inputFolder)).listSync().where(
      (FileSystemEntity file) =>
          _inputFileExtensions.any((ending) => file.path.endsWith(ending)));

  final result = <String, List<String>>{};

  var out = normalize(options.outputFolder);

  filesList.forEach((FileSystemEntity element) {
    final name = getFileNameBase(element.path);

    final fileList = _getPossibleFilesName(element, options);
    final modelFileName = _getPossibleModelFilesName(element, options);

    result[normal(element.path)] = <String>[
      join(out, '$name$_outputFileExtension'),
      join(out, '$name$_outputEnumsFileExtension'),
      join(out, '$name$_outputModelsFileExtension'),
      join(out, '$name$_outputResponsesFileExtension'),
    ];

    result[normal(element.path)]?.addAll(fileList);
    result[normal(element.path)]?.addAll(modelFileName);
  });

  //Register additional outputs in first input
  result[normal(filesList.first.path)]!.add(join(out, _indexFileName));
  print(result);
  return result;
}

List<String> _getPossibleFilesName(
    FileSystemEntity element, GeneratorOptions options) {
  final content = File.fromUri(element.uri).readAsStringSync();
  final codeGenerator = SwaggerCodeGenerator();
  var out = normalize(options.outputFolder);
  final name = getFileNameBase(element.path);
  final requests = codeGenerator.generateRequests(
      content,
      getClassNameFromFileName('fileNameWithExtension'),
      getFileNameWithoutExtension('fileNameWithExtension'),
      options);
  return requests.keys
      .map((e) => join(out, "api\\${e.toLowerCase()}_api.dart"))
      .toList();
}

List<String> _getPossibleModelFilesName(
    FileSystemEntity element, GeneratorOptions options) {
  final content = File.fromUri(element.uri).readAsStringSync();
  final codeGenerator = SwaggerCodeGenerator();
  var out = normalize(options.outputFolder);
  final name = getFileNameBase(element.path);
  final enums = codeGenerator.generateEnums(content, 'filename');
  final models = codeGenerator.generateModels(
      content, getFileNameWithoutExtension('fileNameWithExtension'), options);
  final enumNames = enums.keys
      .map((e) => join(out, "models\\${getCamelCaseName(e)}_enum.dart"))
      .toList();

  final modelsName = models.keys
      .map((e) => join(out, "models\\${getCamelCaseName(e)}.dart"))
      .toList();
  return modelsName..addAll(enumNames);
}

///Root library entry
class SwaggerDartCodeGenerator implements Builder {
  SwaggerDartCodeGenerator(BuilderOptions builderOptions) {
    options = GeneratorOptions.fromJson(builderOptions.config);
  }

  @override
  Map<String, List<String>> get buildExtensions =>
      _buildExtensionsCopy ??= _generateExtensions(options);

  Map<String, List<String>>? _buildExtensionsCopy;

  late GeneratorOptions options;

  final DartFormatter _formatter = DartFormatter();

  @override
  Future<void> build(BuildStep buildStep) async {
    final fileNameWithExtension =
        buildStep.inputId.pathSegments.last.replaceAll('-', '_');
    final fileNameWithoutExtension = getFileNameBase(fileNameWithExtension);

    final contents = await buildStep.readAsString(buildStep.inputId);
    final codeGenerator = SwaggerCodeGenerator();

    final models = codeGenerator.generateModels(
        contents, getFileNameWithoutExtension(fileNameWithExtension), options);

    final responses = codeGenerator.generateResponses(
        contents, getFileNameWithoutExtension(fileNameWithExtension), options);

    final requestBodies = codeGenerator.generateRequestBodies(
        contents, getFileNameWithoutExtension(fileNameWithExtension), options);

    final enums = codeGenerator.generateEnums(
        contents, getFileNameWithoutExtension(fileNameWithExtension));

    final imports = codeGenerator.generateImportsContent(
      contents,
      fileNameWithoutExtension,
      models.isNotEmpty,
      options.buildOnlyModels,
      enums.isNotEmpty,
      options.separateModels,
    );

    final requests = codeGenerator.generateRequests(
        contents,
        getClassNameFromFileName(fileNameWithExtension),
        getFileNameWithoutExtension(fileNameWithExtension),
        options);

    requests.forEach((key, value) async {
      //return service.accept(DartEmitter()).toString();
      final filename = getFileNameBase(key.toLowerCase() + "_api");
      final requestsAssetId = AssetId(buildStep.inputId.package,
          join(options.outputFolder, 'api\\$filename.dart'));
      final requestCalass = """
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part '${filename}.g.dart';
${value.accept(DartEmitter()).toString()}
""";
      await buildStep.writeAsString(requestsAssetId, requestCalass);
    });

    /// Model
    ///
    models.forEach((key, value) async {
      if (value.toString().isNotEmpty) {
        //return service.accept(DartEmitter()).toString();
        final filename = getCamelCaseName(key);
        final requestsAssetId = AssetId(buildStep.inputId.package,
            join(options.outputFolder, 'models\\$filename.dart'));
        final requestCalass = """
import 'package:json_annotation/json_annotation.dart';
part '${filename}.g.dart';
${_tryFormatCode(value.toString())}
""";
        await buildStep.writeAsString(requestsAssetId, requestCalass);
      }
    });

    final dateToJson = codeGenerator.generateDateToJson(contents);

    final copyAssetId = AssetId(
        buildStep.inputId.package,
        join(options.outputFolder,
            '$fileNameWithoutExtension$_outputFileExtension'));

    if (!options.separateModels || !options.buildOnlyModels) {
      //   await buildStep.writeAsString(
      //       copyAssetId,
      //       _generateFileContent(
      //           imports,
      //           options.separateModels ? '' : models,
      //           options.separateModels ? '' : responses,
      //           options.separateModels ? '' : requestBodies,
      //           dateToJson));
    }

    enums.forEach((key, value) async {
      final filename = getCamelCaseName(key);
      final enumsAssetId = AssetId(buildStep.inputId.package,
          join(options.outputFolder, 'models\\${filename}_enum.dart'));
      final enumClass = """
import 'package:json_annotation/json_annotation.dart';
${_tryFormatCode(value.toString())}
""";
      await buildStep.writeAsString(enumsAssetId, enumClass);
    });

    //   if (options.separateModels) {
    //     ///Write models to separate file
    //     final formattedModels = _tryFormatCode(_generateSeparateModelsFileContent(
    //       models,
    //       responses,
    //       requestBodies,
    //       fileNameWithoutExtension,
    //       enums.isNotEmpty,
    //     ));

    //     final enumsAssetId = AssetId(
    //         buildStep.inputId.package,
    //         join(options.outputFolder,
    //             '$fileNameWithoutExtension$_outputModelsFileExtension'));

    //     await buildStep.writeAsString(enumsAssetId, formattedModels);
    //   }

    //   ///Write additional files on first input
    //   if (buildExtensions.keys.first == buildStep.inputId.path) {
    //     await _generateAdditionalFiles(
    //         contents, buildStep.inputId, buildStep, models.isNotEmpty);
    //   }
  }

  String _generateFileContent(String imports, String models, String responses,
      String requestBodies, String dateToJson) {
    final result = """
$imports

$models

$responses

$requestBodies


$dateToJson
""";

    return _tryFormatCode(result);
  }

  String _tryFormatCode(String code) {
    try {
      final formattedResult = _formatter.format(code);
      return formattedResult;
    } catch (e) {
      print('''[WARNING] Code formatting failed.
          Please raise an issue on https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/
          Reason: $e''');
      return code;
    }
  }

  Future<void> _generateAdditionalFiles(String swaggerCode, AssetId inputId,
      BuildStep buildStep, bool hasModels) async {
    final codeGenerator = SwaggerCodeGenerator();

    final indexAssetId =
        AssetId(inputId.package, join(options.outputFolder, _indexFileName));

    final imports = codeGenerator.generateIndexes(swaggerCode, buildExtensions);

    if (!options.buildOnlyModels) {
      await buildStep.writeAsString(indexAssetId, _formatter.format(imports));
    }
  }

  String _generateSeparateModelsFileContent(
    String models,
    String responses,
    String requestBodies,
    String fileNameWithoutExtension,
    bool hasEnums,
  ) {
    final enumsImport = hasEnums
        ? "import '$fileNameWithoutExtension.enums.swagger.dart' as enums;"
        : '';

    return '''
import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
$enumsImport

    part '$fileNameWithoutExtension.models.swagger.g.dart';

    $models

    $responses

    $requestBodies
    ''';
  }
}
