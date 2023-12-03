// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';

part 'get_profileimage_response_model.g.dart';

@JsonSerializable()
class GetProfileImageResponseModel {
  String data;
  int code;
  String? error;

  GetProfileImageResponseModel({
    required this.data,
    required this.code,
    this.error,
  });

  factory GetProfileImageResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetProfileImageResponseModelFromJson(json);
}
