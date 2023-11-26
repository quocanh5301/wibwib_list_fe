import 'package:anime_list/services/api/api_service.dart';
import 'package:anime_list/services/response_models/login_response_model.dart';
import 'package:anime_list/services/response_models/register_response_model.dart';

abstract class IUserRepository {
  Future<LoginResponseModel?> login(
      {required String username, required String password});
  Future<RegisterResponseModel?> register(
      {required String username,
      required String password,
      required String email,
      required String date});
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
}
