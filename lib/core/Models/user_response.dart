import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'user_response.g.dart';

UserResponse userResponseFromJson(String str) => UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

@JsonSerializable()
class UserResponse {
  @JsonKey(name: "code")
  String code;
  @JsonKey(name: "message")
  dynamic message;
  @JsonKey(name: "data")
  Data data;

  UserResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "fullname")
  String fullname;
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "role")
  int role;
  @JsonKey(name: "onsite")
  bool onsite;
  @JsonKey(name: "numberOfPendingImage")
  int numberOfPendingImage;
  @JsonKey(name: "numberOfImage")
  int numberOfImage;
  @JsonKey(name: "sendMail")
  bool sendMail;
  @JsonKey(name: "groupId")
  dynamic groupId;
  @JsonKey(name: "key")
  dynamic key;
  @JsonKey(name: "hasImagebase")
  bool hasImagebase;
  @JsonKey(name: "admin")
  bool admin;

  Data({
    required this.id,
    required this.fullname,
    required this.email,
    required this.role,
    required this.onsite,
    required this.numberOfPendingImage,
    required this.numberOfImage,
    required this.sendMail,
    required this.groupId,
    required this.key,
    required this.hasImagebase,
    required this.admin,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
