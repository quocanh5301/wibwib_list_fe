import 'package:anime_list/blocs/login/login_bloc.dart';
import 'package:anime_list/blocs/register/register_bloc.dart';
import 'package:anime_list/data/repositories/user_repository.dart';
import 'package:anime_list/presentation/widgets/progress_indicator/custom_progress_indicator.dart';
import 'package:anime_list/services/api/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:anime_list/utils/constant/api_path.dart' as apiPath;

final getIt = GetIt.instance;

initializeDependencies() {
  getIt.registerSingleton<Dio>(Dio());

  getIt.registerSingleton<ApiService>(ApiService(
    getIt<Dio>(),
    baseUrl: apiPath.baseURL,
  ));

  getIt.registerSingleton<IUserRepository>(
    UserRepository(apiService: getIt<ApiService>()),
  );

  getIt.registerSingleton<LoginPageBloc>(
      LoginPageBloc(userRepository: getIt<IUserRepository>()));
  getIt.registerSingleton<RegisterPageBloc>(
      RegisterPageBloc(userRepository: getIt<IUserRepository>()));
}
