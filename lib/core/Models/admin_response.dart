// To parse this JSON data, do
//
//     final adminResponse = adminResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'admin_response.g.dart';

AdminResponse adminResponseFromJson(String str) => AdminResponse.fromJson(json.decode(str));

String adminResponseToJson(AdminResponse data) => json.encode(data.toJson());

@JsonSerializable()
class AdminResponse {
  @JsonKey(name: "code")
  String code;
  @JsonKey(name: "message")
  dynamic message;
  @JsonKey(name: "data")
  List<Datum> data;

  AdminResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory AdminResponse.fromJson(Map<String, dynamic> json) => _$AdminResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AdminResponseToJson(this);
}

@JsonSerializable()
class Datum {
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

  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
