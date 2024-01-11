import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../repository/abstract_repository/user_repository.dart';
import 'course_state.dart';

class CourseBloc extends Cubit<CourseState> {
  CourseBloc() : super(CourseInitial());
  final userRepository = GetIt.instance.get<UserRepository>();

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
