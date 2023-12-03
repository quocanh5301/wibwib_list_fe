import 'dart:io';

import 'package:anime_list/data/models/user_account_model.dart';
import 'package:anime_list/services/response_models/get_profileimage_response_model.dart';
import 'package:anime_list/services/response_models/login_response_model.dart';
import 'package:anime_list/services/response_models/register_response_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:anime_list/utils/constant/api_path.dart' as apiPath;

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(
    Dio dio, {
    String baseUrl,
  }) = _ApiService;

  @POST(apiPath.login)
  @FormUrlEncoded()
  Future<LoginResponseModel> login({
    @Field('email') required String userName,
    @Field('password') required String password,
  });

  @POST(apiPath.register)
  @FormUrlEncoded()
  Future<RegisterResponseModel> register({
    @Field('name') required String userName,
    @Field('email') required String userEmail,
    @Field('password') required String password,
    @Field('date') required String date,
  });

//! qa 29/11
  // @POST(apiPath.uploadImg)
  // Future<void> uploadImage(
  //   @Field() FormData image,
  // );

  @POST(apiPath.uploadImg)
  @MultiPart()
  @Headers(<String, dynamic>{"Content-Type": "multipart/form-data"})
  Future<dynamic> uploadImage({
    @Part() required File file,
    @Part() required int userId,
  });

  @GET(apiPath.retrieveImg)
  Future<GetProfileImageResponseModel> retrieveImage({
    @Query('imageId') required String imageId,
  });

  @POST(apiPath.updateImg)
  @MultiPart()
  @Headers(<String, dynamic>{"Content-Type": "multipart/form-data"})
  Future<dynamic> updateImage({
    @Part() required File file,
    @Part() required int userId,
    @Part() required String imageId,
  });

  @POST(apiPath.updateUserData)
  Future<dynamic> updateUserData({
    @Body() required UserDataModel newUserData,
  });

  @GET(apiPath.retrieveUserData)
  Future<UserDataModel> retrieveUserData({
    @Query('userId') required int userId,
  });
}
