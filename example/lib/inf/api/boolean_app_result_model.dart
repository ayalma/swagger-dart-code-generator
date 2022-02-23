import 'package:json_annotation/json_annotation.dart';
part 'boolean_app_result_model.g.dart';
@JsonSerializable(explicitToJson: true)
class BooleanAppResult {
  BooleanAppResult({
    this.data,
    this.isSuccessfull,
    this.error,
  });

  factory BooleanAppResult.fromJson(Map<String, dynamic> json) =>
      _$BooleanAppResultFromJson(json);

  @JsonKey(name: 'Data', includeIfNull: false)
  final bool? data;
  @JsonKey(name: 'IsSuccessfull', includeIfNull: false)
  final bool? isSuccessfull;
  @JsonKey(name: 'Error', includeIfNull: false)
  final ApplicationError? error;
  Map<String, dynamic> toJson() => _$BooleanAppResultToJson(this);
}

extension $BooleanAppResultExtension on BooleanAppResult {
  BooleanAppResult copyWith(
      {bool? data, bool? isSuccessfull, ApplicationError? error}) {
    return BooleanAppResult(
        data: data ?? this.data,
        isSuccessfull: isSuccessfull ?? this.isSuccessfull,
        error: error ?? this.error);
  }
}

