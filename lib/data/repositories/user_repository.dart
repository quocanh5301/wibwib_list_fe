import 'dart:io';
import 'dart:typed_data';

import 'package:anime_list/data/models/user_account_model.dart';
import 'package:anime_list/services/api/api_service.dart';
import 'package:anime_list/services/response_models/get_profileimage_response_model.dart';
import 'package:anime_list/services/response_models/login_response_model.dart';
import 'package:anime_list/services/response_models/register_response_model.dart';
import 'package:dio/dio.dart';

abstract class IUserRepository {
  Future<LoginResponseModel?> login(
      {required String username, required String password});
  Future<RegisterResponseModel?> register(
      {required String username,
      required String password,
      required String email,
      required String date});
  Future<void> uploadImage({
    required File image,
    required int userId,
  });
  Future<GetProfileImageResponseModel?> getImage({
    required String imageId,
  });
  Future<void> updateImage({
    required File image,
    required int userId,
    required String imageId,
  });
  Future<void> updateUserData({
    required UserDataModel data,
  });
  Future<UserDataModel?> retrieveUserData({
    required int userId,
  });
}

class UserRepository extends IUserRepository {
  final ApiService _service;

  UserRepository({
    required ApiService apiService,
  }) : _service = apiService;

  @override
  Future<LoginResponseModel?> login({
    required String username,
    required String password,
  }) async {
    final response = await _service.login(
      userName: username,
      password: password,
    );
    if (response.code == 200) {
      return response;
    } else {
      return null;
    }
  }

  @override
  Future<RegisterResponseModel?> register(
      {required String username,
      required String password,
      required String email,
      required String date}) async {
    print("UserRepository register " + date);
    final response = await _service.register(
      userName: username,
      password: password,
      userEmail: email,
      date: date,
    );
    if (response.code == 200) {
      print("response 200");
      return response;
    } else {
      print("response fail");
      return null;
    }
  }

  @override
  Future<void> uploadImage({
    required File image,
    required int userId,
  }) async {
    try {
      final response = await _service.uploadImage(
        file: image,
        userId: userId,
      );
      // if (response.code == 200) {
      //   print("response 200");
      //   return response;
      // } else {
      //   print("response fail");
      //   return null;
      // }
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<GetProfileImageResponseModel?> getImage(
      {required String imageId}) async {
    try {
      final response = await _service.retrieveImage(
        imageId: imageId,
      );
      if (response.code == 200) {
        print("response 200");
        return response;
      } else {
        print("response fail");
        return null;
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }

  @override
  Future<void> updateImage(
      {required File image,
      required int userId,
      required String imageId}) async {
    try {
      print("$imageId ${image.path} $userId");
      final response = await _service.updateImage(
        imageId: imageId,
        file: image,
        userId: userId,
      );
      // if (response.code == 200) {
      //   print("response 200");
      //   return response;
      // } else {
      //   print("response fail");
      //   return null;
      // }
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<UserDataModel?> retrieveUserData({required int userId}) async {
    try {
      print("userId $userId");
      final response = await _service.retrieveUserData(userId: userId);
      return response;
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> updateUserData({required UserDataModel data}) async {
    try {
      print("UserDataModel $data");
      final response = await _service.updateUserData(newUserData: data);
    } catch (e) {
      print(e);
    }
  }
}
