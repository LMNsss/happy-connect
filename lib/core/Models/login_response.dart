// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'login_response.g.dart';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: "code")
  String code;
  @JsonKey(name: "message")
  dynamic message;
  @JsonKey(name: "data")
  Data data;

  LoginResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "access_token")
  String accessToken;
  @JsonKey(name: "expires_in")
  int expiresIn;
  @JsonKey(name: "refresh_expires_in")
  int refreshExpiresIn;
  @JsonKey(name: "refresh_token")
  String refreshToken;
  @JsonKey(name: "token_type")
  String tokenType;
  @JsonKey(name: "session_state")
  String sessionState;
  @JsonKey(name: "scope")
  String scope;

  Data({
    required this.accessToken,
    required this.expiresIn,
    required this.refreshExpiresIn,
    required this.refreshToken,
    required this.tokenType,
    required this.sessionState,
    required this.scope,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
