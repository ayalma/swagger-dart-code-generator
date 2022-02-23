import 'package:recase/recase.dart';
import 'package:swagger_dart_code_generator/src/extensions/string_extension.dart';
import 'package:path/path.dart' as p;

String getClassNameFromFileName(String file) {
  final name = getFileNameWithoutExtension(file).replaceAll('-', '_');
  final result = name.split('_').map((String e) => e.capitalize);
  return result.join();
}

String getFileNameWithoutExtension(String file) {
  return file.split('.').first;
}

String getFileNameBase(String filePath) {
  return p.basenameWithoutExtension(filePath).replaceAll('-', '_');
}

String getCamelCaseName(String name) {
  // Single character look-ahead for capital letter.
  final temp = ReCase(name);
  return temp.snakeCase;
}
