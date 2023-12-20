import 'package:base_app/module/repository/abstract_repository/user_repository.dart';
import 'package:base_app/module/repository/implement_repository/user_repository_impl.dart';
import 'package:get_it/get_it.dart';

import 'service/network/dio_client.dart';

Future initialDependencies() async {
  GetIt.instance.registerLazySingleton(() => DioClient());
  _registerRepository();
  _registerBloc();
}

_registerRepository() {
  GetIt.instance
      .registerLazySingleton<UserRepository>(() => UserRepositoryImpl());
}

_registerBloc() {}
