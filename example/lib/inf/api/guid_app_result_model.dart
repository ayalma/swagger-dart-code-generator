import 'package:json_annotation/json_annotation.dart';
part 'guid_app_result_model.g.dart';
@JsonSerializable(explicitToJson: true)
class GuidAppResult {
  GuidAppResult({
    this.data,
    this.isSuccessfull,
    this.error,
  });

  factory GuidAppResult.fromJson(Map<String, dynamic> json) =>
      _$GuidAppResultFromJson(json);

  @JsonKey(name: 'Data', includeIfNull: false, defaultValue: '')
  final String? data;
  @JsonKey(name: 'IsSuccessfull', includeIfNull: false)
  final bool? isSuccessfull;
  @JsonKey(name: 'Error', includeIfNull: false)
  final ApplicationError? error;
  Map<String, dynamic> toJson() => _$GuidAppResultToJson(this);
}

extension $GuidAppResultExtension on GuidAppResult {
  GuidAppResult copyWith(
      {String? data, bool? isSuccessfull, ApplicationError? error}) {
    return GuidAppResult(
        data: data ?? this.data,
        isSuccessfull: isSuccessfull ?? this.isSuccessfull,
        error: error ?? this.error);
  }
}

