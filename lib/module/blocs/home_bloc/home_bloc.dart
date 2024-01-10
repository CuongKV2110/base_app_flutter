import 'package:base_app/module/models/dto/course_dto.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../repository/abstract_repository/user_repository.dart';
import 'home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(HomeInitial());
  final userRepository = GetIt.instance.get<UserRepository>();
  List<CourseDto> list = [];

  Future<void> getListPost() async {
    emit(HomeLoading());
    try {
      final response = await userRepository.getListCourse();
      list = response;
      emit(HomeSuccess());
    } catch (e) {
      emit(HomeError());
      rethrow;
    }
  }

  void dispose() {
    close();
  }
}
