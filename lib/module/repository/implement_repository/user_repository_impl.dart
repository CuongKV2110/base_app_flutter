import 'package:base_app/module/models/dto/post_dto.dart';
import 'package:base_app/module/repository/abstract_repository/user_repository.dart';

import '../../../service/api/user_service.dart';

class UserRepositoryImpl extends UserRepository {
  final userService = UserService();

  @override
  Future<List<PostDto>> getListPost() {
    return userService.getListPost();
  }
}
