import 'package:base_app/module/blocs/menu_bloc/menu_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../models/dto/post_dto.dart';
import '../../repository/abstract_repository/user_repository.dart';

class MenuBloc extends Cubit<MenuState> {
  MenuBloc() : super(MenuInitial());
  final userRepository = GetIt.instance.get<UserRepository>();
  List<PostDto> list = [];

  Future<void> getListPost() async {
    emit(MenuLoading());
    try {
      final response = await userRepository.getListPost();
      list = response;
      emit(MenuSuccess());
    } catch (e) {
      emit(MenuError());
      rethrow;
    }
  }

  void dispose() {
    close();
  }
}
