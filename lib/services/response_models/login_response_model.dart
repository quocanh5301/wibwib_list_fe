// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  String accessToken;
  String refreshToken;
  int code;
  String? mess;

  LoginResponseModel({
    required this.accessToken,
    required this.refreshToken,
    required this.code,
  });

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'accessToken': accessToken,
  //     'refreshToken': refreshToken,
  //   };
  // }

  // factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
  //   return LoginResponseModel(
  //     accessToken: map['accessToken'] as String,
  //     refreshToken: map['refreshToken'] as String,
  //   );
  // }

  // String toJson() => json.encode(toMap());

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
  // factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel.fromMap(json);
}
