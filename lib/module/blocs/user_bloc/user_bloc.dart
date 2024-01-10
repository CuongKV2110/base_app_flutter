import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../models/dto/post_dto.dart';
import '../../repository/abstract_repository/user_repository.dart';
import 'user_state.dart';

class UserBloc extends Cubit<UserState> {
  UserBloc() : super(UserInitial());
  final userRepository = GetIt.instance.get<UserRepository>();
  List<PostDto> list = [];

  Future<void> getListPost() async {
    emit(UserLoading());
    try {
      final response = await userRepository.getListUser();
      list = response;
      emit(UserSuccess());
    } catch (e) {
      emit(UserError());
      rethrow;
    }
  }

  void dispose() {
    close();
  }
}
