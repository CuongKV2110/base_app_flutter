import 'package:base_app/module/models/dto/post_dto.dart';

abstract class UserRepository {
  Future<List<PostDto>> getListPost();
}
