import 'package:base_app/module/models/dto/course_dto.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../repository/abstract_repository/user_repository.dart';
import 'detail_course_state.dart';

class DetailCourseBloc extends Cubit<DetailCourseState> {
  DetailCourseBloc() : super(DetailCourseInitial());
  final userRepository = GetIt.instance.get<UserRepository>();

  Future<CourseDto> getDetailCourse(
    String id,
  ) async {
    emit(DetailCourseLoading());
    try {
      final courseDto = await userRepository.getDetailCourse(id);
      emit(DetailCourseSuccess(courseDto));
      return courseDto;
    } catch (e) {
      emit(DetailCourseError());
      rethrow;
    }
  }

  void dispose() {
    close();
  }
}
