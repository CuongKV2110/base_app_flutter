import 'package:base_app/module/models/dto/course_dto.dart';
import 'package:base_app/widget/app_loading_overlay.dart';
import 'package:base_app/widget/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/constants.dart';
import '../../module/blocs/Home_bloc/Home_bloc.dart';
import '../../module/blocs/Home_bloc/home_state.dart';
import '../home_page/course_item_widget.dart';

class MyCoursePage extends StatefulWidget {
  const MyCoursePage({Key? key}) : super(key: key);

  @override
  State<MyCoursePage> createState() => _MyCoursePageState();
}

class _MyCoursePageState extends State<MyCoursePage> {
  final HomeBloc _bloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    _bloc.getListPost();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>.value(
      value: _bloc,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Container(
            color: colorGrayd2,
            child: AppLoadingOverlay(
              isLoading: state is HomeLoading,
              child: SafeArea(
                child: Scaffold(
                  appBar: AppBarWidget(title: 'My Course Page'),
                  body: _build(state),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _build(HomeState state) {
    if (state is HomeError) {
      return const Center(
        child: Text("Error"),
      );
    } else if (state is HomeSuccess) {
      List<CourseDto> listCourse = _bloc.list;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return Column(
              children: [
                hSpaceItem1,
                CourseItemWidget(courseDto: listCourse[index])
              ],
            );
          },
          separatorBuilder: (context, index) {
            return hSpaceItem1;
          },
          itemCount: listCourse.length,
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
