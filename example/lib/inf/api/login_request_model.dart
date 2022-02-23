import 'package:json_annotation/json_annotation.dart';
part 'login_request_model.g.dart';
@JsonSerializable(explicitToJson: true)
class LoginRequest {
  LoginRequest({
    this.username,
    this.password,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  @JsonKey(name: 'username', includeIfNull: false, defaultValue: '')
  final String? username;
  @JsonKey(name: 'password', includeIfNull: false, defaultValue: '')
  final String? password;
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}

extension $LoginRequestExtension on LoginRequest {
  LoginRequest copyWith({String? username, String? password}) {
    return LoginRequest(
        username: username ?? this.username,
        password: password ?? this.password);
  }
}

