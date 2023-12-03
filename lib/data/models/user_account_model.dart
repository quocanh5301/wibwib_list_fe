// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:anime_list/utils/helper/date_time_helper.dart' as date;

part 'user_account_model.g.dart';

@JsonSerializable()
class UserDataModel {
  int id;
  String userName;
  String userEmail;
  int watchedNum;
  int favoriteNum;
  int joinSince;
  String? image;

  UserDataModel({
    required this.id,
    required this.userName,
    required this.userEmail,
    required this.watchedNum,
    required this.favoriteNum,
    required this.joinSince,
    this.image,
  });

  Map<String, dynamic> toMap(UserDataModel instance) {
    return <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'userEmail': instance.userEmail,
      'watchedNum': instance.watchedNum,
      'favoriteNum': instance.favoriteNum,
      'joinSince': instance.joinSince,
      'image': instance.image,
    };
  }

  factory UserDataModel.fromMap(Map<String, dynamic> map) {
    return UserDataModel(
      id: map['id'] as int,
      userName: map['user_name'] as String,
      userEmail: map['user_email'] as String,
      watchedNum: map['watched_num'] as int,
      favoriteNum: map['favorite_num'] as int,
      joinSince: map['date'] as int,
      image: map['image'] == null ? "" : map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap(this));

  // factory UserDataModel.fromJson(Map<String, dynamic> json) =>
  //     UserDataModel.fromMap(json);

  factory UserDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserDataModelFromJson(json);

  @override
  String toString() {
    return 'UserDataModel(id: $id, userName: $userName, userEmail: $userEmail, watchedNum: $watchedNum, favoriteNum: $favoriteNum, joinSince: $joinSince, image: $image)';
  }
}
