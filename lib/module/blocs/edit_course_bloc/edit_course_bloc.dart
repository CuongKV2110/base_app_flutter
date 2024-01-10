import 'package:base_app/module/models/dto/course_dto.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../repository/abstract_repository/user_repository.dart';
import 'edit_course_state.dart';

class EditCourseBloc extends Cubit<EditCourseState> {
  EditCourseBloc() : super(EditCourseInitial());
  final userRepository = GetIt.instance.get<UserRepository>();

  Future<bool> updateCourse(CourseDto courseUpdate) async {
    emit(EditCourseLoading());
    try {
      final response = await userRepository.updateCourse(courseUpdate);
      emit(EditCourseSuccess());
      return response;
    } catch (e) {
      emit(EditCourseError());
      rethrow;
    }
  }

  void dispose() {
    close();
  }
}
