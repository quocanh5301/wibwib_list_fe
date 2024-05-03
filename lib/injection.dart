import 'package:anime_list/blocs/login/login_bloc.dart';
import 'package:anime_list/blocs/profile/profile_bloc.dart';
import 'package:anime_list/blocs/register/register_bloc.dart';
import 'package:anime_list/data/repositories/user_repository.dart';
import 'package:anime_list/services/api/api_service.dart';
import 'package:anime_list/utils/helper/image_helper.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:anime_list/utils/constant/api_path.dart' as apiPath;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

final getIt = GetIt.instance;

initializeDependencies() {
  getIt.registerSingleton<Dio>(Dio());

  getIt.registerSingleton<ImagePicker>(ImagePicker());
  getIt.registerSingleton<ImageCropper>(ImageCropper());

  getIt.registerSingleton<ImageHelper>(ImageHelper(
    imageCropper: getIt<ImageCropper>(),
    imagePicker: getIt<ImagePicker>(),
  ));

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

  getIt.registerSingleton<ProfilePageBloc>(
      ProfilePageBloc(userRepository: getIt<IUserRepository>()));
}
