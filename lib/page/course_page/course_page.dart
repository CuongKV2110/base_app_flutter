import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/constants.dart';
import '../../module/blocs/course_bloc/course_bloc.dart';
import '../../module/blocs/course_bloc/course_state.dart';
import '../../widget/app_loading_overlay.dart';
import '../../widget/appbar_widget.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  final CourseBloc _bloc = CourseBloc();

  @override
  void initState() {
    super.initState();
    // _bloc.getListPost();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CourseBloc>.value(
      value: _bloc,
      child: BlocBuilder<CourseBloc, CourseState>(
        builder: (context, state) {
          return AppLoadingOverlay(
            child: SafeArea(
              child: Scaffold(
                backgroundColor: colorGrayd2,
                appBar: AppBarWidget(
                  title: "COURSE PAGE",
                ),
                body: _build(state),
              ),
            ),
            isLoading: state is CourseLoading,
          );
        },
      ),
    );
  }

  _build(CourseState state) {
    if (state is CourseError) {
      return Center(child: const Text("Error"));
    } else if (state is CourseSuccess) {
      return Text('OK');
    } else {
      return const SizedBox();
    }
  }
}
