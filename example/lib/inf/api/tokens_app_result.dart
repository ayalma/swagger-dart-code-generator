import 'package:json_annotation/json_annotation.dart';
part 'tokens_app_result.g.dart';
@JsonSerializable(explicitToJson: true)
class TokensAppResult {
  TokensAppResult({
    this.data,
    this.isSuccessfull,
    this.error,
  });

  factory TokensAppResult.fromJson(Map<String, dynamic> json) =>
      _$TokensAppResultFromJson(json);

  @JsonKey(name: 'Data', includeIfNull: false)
  final Tokens? data;
  @JsonKey(name: 'IsSuccessfull', includeIfNull: false)
  final bool? isSuccessfull;
  @JsonKey(name: 'Error', includeIfNull: false)
  final ApplicationError? error;
  Map<String, dynamic> toJson() => _$TokensAppResultToJson(this);
}

extension $TokensAppResultExtension on TokensAppResult {
  TokensAppResult copyWith(
      {Tokens? data, bool? isSuccessfull, ApplicationError? error}) {
    return TokensAppResult(
        data: data ?? this.data,
        isSuccessfull: isSuccessfull ?? this.isSuccessfull,
        error: error ?? this.error);
  }
}

