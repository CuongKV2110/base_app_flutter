import 'package:base_app/module/blocs/menu_bloc/menu_bloc.dart';
import 'package:base_app/module/blocs/menu_bloc/menu_state.dart';
import 'package:base_app/widget/app_loading_overlay.dart';
import 'package:base_app/widget/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MenuBloc _bloc = MenuBloc();

  @override
  void initState() {
    super.initState();
    _bloc.getListPost();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MenuBloc>.value(
      value: _bloc,
      child: BlocBuilder<MenuBloc, MenuState>(
        builder: (context, state) {
          return AppLoadingOverlay(
            child: _build(state),
            isLoading: state is MenuLoading,
          );
        },
      ),
    );
  }

  _build(MenuState state) {
    if (state is MenuError) {
      return const Text("Error");
    } else if (state is MenuSuccess) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBarWidget(
            title: "HOME PAGE",
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
