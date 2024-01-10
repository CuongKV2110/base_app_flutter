import 'package:base_app/module/models/dto/course_dto.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../repository/abstract_repository/user_repository.dart';
import 'course_state.dart';

class CourseBloc extends Cubit<CourseState> {
  CourseBloc() : super(CourseInitial());
  final userRepository = GetIt.instance.get<UserRepository>();
  List<CourseDto> list = [];

  Future<bool> createCourse(
    String name,
    String type,
    String price,
    String detail,
  ) async {
    emit(CourseLoading());
    try {
      final response =
          await userRepository.createCourse(name, type, price, detail);
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
