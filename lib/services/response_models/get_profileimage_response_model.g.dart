// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_profileimage_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProfileImageResponseModel _$GetProfileImageResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetProfileImageResponseModel(
      data: json['data'] as String,
      code: json['code'] as int,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$GetProfileImageResponseModelToJson(
        GetProfileImageResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'code': instance.code,
      'error': instance.error,
    };
