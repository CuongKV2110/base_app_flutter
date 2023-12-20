import 'package:base_app/module/models/dto/post_dto.dart';

import 'base_api_service.dart';

class UserService extends BaseApiService {
  Future<List<PostDto>> getListPost() async {
    try {
      // Gửi yêu cầu GET đến đường dẫn 'posts' bằng Dio
      final response = await dio.get('posts');

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
}
