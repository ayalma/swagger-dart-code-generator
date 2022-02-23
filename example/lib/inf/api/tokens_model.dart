import 'package:json_annotation/json_annotation.dart';
part 'tokens_model.g.dart';
@JsonSerializable(explicitToJson: true)
class Tokens {
  Tokens({
    this.token,
    this.refreshToken,
  });

  factory Tokens.fromJson(Map<String, dynamic> json) => _$TokensFromJson(json);

  @JsonKey(name: 'token', includeIfNull: false, defaultValue: '')
  final String? token;
  @JsonKey(name: 'refreshToken', includeIfNull: false, defaultValue: '')
  final String? refreshToken;
  Map<String, dynamic> toJson() => _$TokensToJson(this);
}

extension $TokensExtension on Tokens {
  Tokens copyWith({String? token, String? refreshToken}) {
    return Tokens(
        token: token ?? this.token,
        refreshToken: refreshToken ?? this.refreshToken);
  }
}

