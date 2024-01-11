import 'package:base_app/module/models/dto/course_dto.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../repository/abstract_repository/user_repository.dart';
import 'create_course_state.dart';

class CreateCourseBloc extends Cubit<CreateCourseState> {
  CreateCourseBloc() : super(CreateCourseInitial());
  final userRepository = GetIt.instance.get<UserRepository>();

  Future<bool> createCourse(
      String name, String type, String price, String description) async {
    emit(CreateCourseLoading());
    try {
      final response =
          await userRepository.createCourse(name, type, price, description);
      emit(CreateCourseSuccess());
      return response;
    } catch (e) {
      emit(CreateCourseError());
      rethrow;
    }
  }

  void dispose() {
    close();
  }
}
