// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataModel _$UserDataModelFromJson(Map<String, dynamic> json) =>
    UserDataModel(
      id: json['id'] as int,
      userName: json['userName'] as String,
      userEmail: json['userEmail'] as String,
      watchedNum: json['watchedNum'] as int,
      favoriteNum: json['favoriteNum'] as int,
      joinSince: json['joinSince'] as int,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$UserDataModelToJson(UserDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'userEmail': instance.userEmail,
      'watchedNum': instance.watchedNum,
      'favoriteNum': instance.favoriteNum,
      'joinSince': instance.joinSince,
      'image': instance.image,
    };
