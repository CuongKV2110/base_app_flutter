import 'package:base_app/widget/app_loading_overlay.dart';
import 'package:base_app/widget/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    _bloc.getListPost();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>.value(
      value: _bloc,
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return AppLoadingOverlay(
            child: _build(state),
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
      return SafeArea(
        child: Scaffold(
          backgroundColor: colorGrayd2,
          appBar: AppBarWidget(
            title: "Search PAGE",
          ),
          body: ListView.separated(
            itemCount: _bloc.list.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    //<-- SEE HERE
                    side: const BorderSide(width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: const Color(0xff6ae792),
                    child: Text(
                      _bloc.list[index].id.toString(),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  title: Text(
                    _bloc.list[index].title,
                  ),
                  subtitle: const Text('Item description'),
                  trailing: const Icon(Icons.more_vert),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 6,
              );
            },
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
