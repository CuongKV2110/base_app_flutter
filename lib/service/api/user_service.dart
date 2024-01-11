import 'package:base_app/module/models/dto/course_dto.dart';
import 'package:base_app/module/models/dto/menu_item_dto.dart';
import 'package:base_app/module/models/dto/post_dto.dart';

import 'base_api_service.dart';

class UserService extends BaseApiService {
  Future<List<PostDto>> getListUser() async {
    try {
      // Gửi yêu cầu GET đến đường dẫn 'posts' bằng Dio
      final response = await dio.get('users');

      // Kiểm tra xem dữ liệu phản hồi có phải là một danh sách không
      if (response.data is List) {
        // Trích xuất dữ liệu từ phản hồi
        final List<dynamic> data = response.data;

        // Ánh xạ dữ liệu động thành danh sách các đối tượng PostDto
        List<PostDto> postList = data.map((e) => PostDto.fromJson(e)).toList();

        // Trả về danh sách các đối tượng PostDto
        return postList;
      } else {
        // Xử lý trường hợp dữ liệu không phải là một danh sách
        print('Invalid response format');
        return []; // hoặc trả về giá trị mặc định khác tùy thuộc vào yêu cầu của bạn
      }
    } catch (e) {
      // Ném lại ngoại lệ nếu có lỗi xảy ra
      rethrow;
    }
  }

  Future<List<MenuItemDto>> getListMenu() async {
    try {
      final response = await dio.get('list_food');
      if (response.data is List) {
        final List<dynamic> data = response.data;
        List<MenuItemDto> listMenu =
            data.map((e) => MenuItemDto.fromJson(e)).toList();
        return listMenu;
      } else {
        print('Invalid response format');
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CourseDto>> getListCourse() async {
    try {
      final response = await dio.get('course/app/list_course');
      if (response.data is List) {
        final List<dynamic> data = response.data;
        List<CourseDto> listCourse =
            data.map((e) => CourseDto.fromJson(e)).toList();
        return listCourse;
      } else {
        print('Invalid response format');
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<CourseDto> getDetailCourse(String id) async {
    try {
      final response = await dio.get('course/$id/detail');
      return CourseDto.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateCourse(CourseDto courseUpdate) async {
    try {
      final data = {
        "name": courseUpdate.name,
        "type": courseUpdate.type,
        "price": courseUpdate.price,
        "description": courseUpdate.description,
        "image": courseUpdate.image
      };
      final response = await dio.put('course/${courseUpdate.id}', data: data);
      if (response.data == 'success') {
        print('OK');
        return true;
      } else {
        print('Fail');
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> createCourse(
      String name, String type, String price, String description) async {
    try {
      final data = {
        "name": name,
        "type": type,
        "price": price,
        "description": description,
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQor9vCOctnpA5k8xjEEEJaC7gshdSE7PBRPg&usqp=CAUhu"
      };
      final response = await dio.post('course/create_course', data: data);
      if (response.data == 'success') {
        print('OK');
        return true;
      } else {
        print('Fail');
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteCourse(String id) async {
    try {
      final response = await dio.delete('course/$id');
      if (response.data == 'success') {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }
}
