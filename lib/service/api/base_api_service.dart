import 'package:base_app/service/network/dio_client.dart';
import 'package:get_it/get_it.dart';

class BaseApiService {
  DioClient dio = GetIt.instance.get<DioClient>();
}
