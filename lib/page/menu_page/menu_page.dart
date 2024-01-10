import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/constants.dart';
import '../../module/blocs/menu_bloc/menu_bloc.dart';
import '../../module/blocs/menu_bloc/menu_state.dart';
import '../../widget/app_loading_overlay.dart';
import '../../widget/appbar_widget.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
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
      return Center(child: const Text("Error"));
    } else if (state is MenuSuccess) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: colorGrayd2,
          appBar: AppBarWidget(
            title: "Menu PAGE",
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 10.0,
              children: List.generate(_bloc.list.length, (index) {
                return Column(
                  children: [
                    Container(
                      width: 200,
                      height: 100,
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Text(_bloc.list[index].name),
                          Text(_bloc.list[index].detail),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Icon(
                                Icons.add_shopping_cart,
                                size: 20,
                              ),
                              _bloc.list[index].favorite
                                  ? const Icon(
                                      Icons.favorite,
                                      size: 20,
                                      color: Colors.red,
                                    )
                                  : const Icon(
                                      Icons.favorite_border,
                                      size: 20,
                                    ),
                              const Icon(
                                Icons.delete_forever,
                                size: 20,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      _bloc.list[index].name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      "${_bloc.list[index].price} VNĐ",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
