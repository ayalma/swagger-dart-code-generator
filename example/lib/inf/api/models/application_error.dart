import 'package:json_annotation/json_annotation.dart';
part 'application_error.g.dart';
@JsonSerializable(explicitToJson: true)
class ApplicationError {
  ApplicationError({
    this.code,
    this.description,
    this.descriptionFa,
    this.validationErrors,
  });

  factory ApplicationError.fromJson(Map<String, dynamic> json) =>
      _$ApplicationErrorFromJson(json);

  @JsonKey(name: 'code', includeIfNull: false, defaultValue: '')
  final String? code;
  @JsonKey(name: 'description', includeIfNull: false, defaultValue: '')
  final String? description;
  @JsonKey(name: 'descriptionFa', includeIfNull: false, defaultValue: '')
  final String? descriptionFa;
  @JsonKey(name: 'validationErrors', includeIfNull: false, defaultValue: '')
  final String? validationErrors;
  Map<String, dynamic> toJson() => _$ApplicationErrorToJson(this);
}

extension $ApplicationErrorExtension on ApplicationError {
  ApplicationError copyWith(
      {String? code,
      String? description,
      String? descriptionFa,
      String? validationErrors}) {
    return ApplicationError(
        code: code ?? this.code,
        description: description ?? this.description,
        descriptionFa: descriptionFa ?? this.descriptionFa,
        validationErrors: validationErrors ?? this.validationErrors);
  }
}

