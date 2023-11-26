import 'package:anime_list/services/response_models/login_response_model.dart';
import 'package:anime_list/services/response_models/register_response_model.dart';
import 'package:dio/dio.dart';
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
}
