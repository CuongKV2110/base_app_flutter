import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../models/dto/course_dto.dart';
import '../../repository/abstract_repository/user_repository.dart';
import 'course_state.dart';

class CourseBloc extends Cubit<CourseState> {
  CourseBloc() : super(CourseInitial());
  final userRepository = GetIt.instance.get<UserRepository>();
  List<CourseDto> list = [];

  Future<void> getListPost() async {
    emit(CourseLoading());
    try {
      final response = await userRepository.getListCourse();
      list = response;
      emit(CourseSuccess());
    } catch (e) {
      emit(CourseError());
      rethrow;
    }
  }

  Future<bool> deleteCourse(String id) async {
    emit(CourseLoading());
    try {
      final response = await userRepository.deleteCourse(id);
      emit(CourseSuccess());
      return response;
    } catch (e) {
      emit(CourseError());
      rethrow;
    }
  }

  void dispose() {
    close();
  }
}
