import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import '../../constants/constants.dart';
import '../../module/blocs/course_bloc/course_bloc.dart';
import '../../module/blocs/course_bloc/course_state.dart';
import '../../module/models/dto/course_dto.dart';
import '../../widget/app_loading_overlay.dart';

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
    _bloc.getListPost();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CourseBloc>.value(
      value: _bloc,
      child: BlocBuilder<CourseBloc, CourseState>(
        builder: (context, state) {
          return AppLoadingOverlay(
            isLoading: state is CourseLoading,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: colorGrayd2,
                body: Padding(
                  padding: const EdgeInsets.fromLTRB(22, 20, 22, 0),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Text('Course Page'),
                          Text('AAA'),
                        ],
                      ),
                      _build(state),
                      hSpaceItem,
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _build(CourseState state) {
    if (state is CourseError) {
      return const Center(
        child: Text("Error"),
      );
    } else if (state is CourseSuccess) {
      List<CourseDto> listCourse = _bloc.list;
      return Expanded(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 20.0, // Spacing between columns
            mainAxisSpacing: 20.0, // Spacing between rows
          ),
          itemCount: listCourse.length, // Number of items in the grid
          itemBuilder: (BuildContext context, int index) {
            // This function is called for each item in the grid
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 0.2),
                    blurRadius: 1,
                    spreadRadius: 0.5,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Ionicons.home),
                        Icon(Ionicons.bookmark_outline)
                      ],
                    ),
                    Text(listCourse[index].name),
                    Text(listCourse[index].type),
                    const Text('2342432 VND'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 60,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.amberAccent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Text('Detail'),
                          ),
                        ),
                        Container(
                          width: 80,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.amberAccent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Text('Buy now'),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
