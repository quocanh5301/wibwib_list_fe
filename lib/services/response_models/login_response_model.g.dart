// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    LoginResponseModel(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      code: json['code'] as int,
    )..mess = json['mess'] as String?;

Map<String, dynamic> _$LoginResponseModelToJson(LoginResponseModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'code': instance.code,
      'mess': instance.mess,
    };
