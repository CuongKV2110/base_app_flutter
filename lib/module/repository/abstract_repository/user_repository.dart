import 'package:base_app/module/models/dto/course_dto.dart';
import 'package:base_app/module/models/dto/menu_item_dto.dart';
import 'package:base_app/module/models/dto/post_dto.dart';

abstract class UserRepository {
  Future<List<PostDto>> getListUser();

  Future<List<MenuItemDto>> getListMenu();

  Future<List<CourseDto>> getListCourse();

  Future<CourseDto> getDetailCourse(String id);

  Future<bool> updateCourse(CourseDto courseUpdate);

  Future<bool> deleteCourse(String id);

  Future<bool> createCourse(
      String name, String type, String price, String description);
}
