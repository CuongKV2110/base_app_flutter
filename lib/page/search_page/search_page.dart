import 'package:base_app/widget/app_loading_overlay.dart';
import 'package:base_app/widget/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import '../../constants/constants.dart';
import '../../module/blocs/user_bloc/user_bloc.dart';
import '../../module/blocs/user_bloc/user_state.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final UserBloc _bloc = UserBloc();

  @override
  void initState() {
    super.initState();
    // _bloc.getListPost();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>.value(
      value: _bloc,
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return AppLoadingOverlay(
            child: SafeArea(
              child: Scaffold(
                backgroundColor: colorGrayd2,
                appBar: AppBarWidget(
                  title: "SEARCH PAGE",
                ),
                body: _build(state),
              ),
            ),
            isLoading: state is UserLoading,
          );
        },
      ),
    );
  }

  _build(UserState state) {
    if (state is UserError) {
      return Center(child: const Text("Error"));
    } else if (state is UserSuccess) {
      return Text('Seacrch');
    } else {
      return const SizedBox();
    }
  }
}
