import 'package:base_app/module/blocs/detail_course_bloc/detail_course_state.dart';
import 'package:base_app/widget/app_loading_overlay.dart';
import 'package:base_app/widget/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/constants.dart';
import '../../module/blocs/detail_course_bloc/detail_course_bloc.dart';

class DetailCoursePage extends StatefulWidget {
  final String id;
  const DetailCoursePage({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailCoursePage> createState() => _DetailCoursePageState();
}

class _DetailCoursePageState extends State<DetailCoursePage> {
  final DetailCourseBloc _bloc = DetailCourseBloc();

  @override
  void initState() {
    super.initState();
    _bloc.getDetailCourse(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailCourseBloc>.value(
      value: _bloc,
      child: BlocBuilder<DetailCourseBloc, DetailCourseState>(
        builder: (context, state) {
          return AppLoadingOverlay(
            isLoading: state is DetailCourseLoading,
            child: Container(
              color: colorGrayd2,
              child: SafeArea(
                child: Scaffold(
                  backgroundColor: colorGrayd2,
                  appBar: AppBarWidget(
                    title: "DETAIL COURSE PAGE",
                  ),
                  body: _build(state),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _build(DetailCourseState state) {
    if (state is DetailCourseError) {
      return const Center(
        child: Text("Error"),
      );
    } else if (state is DetailCourseSuccess) {
      print(state.courseDto.name);
      print(state.courseDto.type);
      print(state.courseDto.description);
      print(state.courseDto.price);
      return const Text('OK');
    } else {
      return const SizedBox();
    }
  }
}
