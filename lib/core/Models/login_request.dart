// To parse this JSON data, do
//
//     final loginRequest = loginRequestFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'login_request.g.dart';

LoginRequest loginRequestFromJson(String str) => LoginRequest.fromJson(json.decode(str));

String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

@JsonSerializable()
class LoginRequest {
  @JsonKey(name: "username")
  String username;
  @JsonKey(name: "password")
  String password;
  @JsonKey(name: "grant_type")
  String grantType;

  LoginRequest({
    required this.username,
    required this.password,
    required this.grantType,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
