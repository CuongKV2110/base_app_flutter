import 'package:base_app/page/root_page/root_page.dart';
import 'package:base_app/widget/app_button.dart';
import 'package:base_app/widget/app_input.dart';
import 'package:base_app/widget/appbar_widget.dart';
import 'package:base_app/widget/keyboard_dismiss.dart';
import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../module/blocs/course_bloc/course_bloc.dart';

class CreateCoursePage extends StatefulWidget {
  const CreateCoursePage({Key? key}) : super(key: key);

  @override
  State<CreateCoursePage> createState() => _CreateCoursePageState();
}

class _CreateCoursePageState extends State<CreateCoursePage> {
  final CourseBloc _bloc = CourseBloc();
  final _formKey = GlobalKey<FormState>();
  final nameTextController = TextEditingController();
  final typeTextController = TextEditingController();
  final priceTextController = TextEditingController();
  final detailTextController = TextEditingController();
  final nameKey = GlobalKey();
  final typeKey = GlobalKey();
  final priceKey = GlobalKey();
  final detailKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorGrayd2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBarWidget(
            title: "Create Course",
          ),
          body: WKeyboardDismiss(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      AppInput(
                        title: "Tên khóa học",
                        controller: nameTextController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Empty text";
                          }
                          return null;
                        },
                      ),
                      hSpaceItem2,
                      AppInput(
                        title: "Thể loại",
                        controller: typeTextController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Empty text";
                          }
                          return null;
                        },
                      ),
                      hSpaceItem2,
                      AppInput(
                        title: "Giá tiền",
                        controller: priceTextController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Empty text";
                          }
                          return null;
                        },
                      ),
                      hSpaceItem2,
                      AppInput(
                        title: "Mô tả khóa học",
                        controller: detailTextController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Empty text";
                          }
                          return null;
                        },
                      ),
                      hSpaceItem2,
                      Center(
                        child: SizedBox(
                          width: 120,
                          child: AppButton(
                            backgroundColor: Colors.blue,
                            title: 'Thêm khóa học',
                            onTap: () {
                              if (_formKey.currentState?.validate() == true) {
                                onSubmit();
                              } else {
                                if (nameTextController.text.isEmpty) {
                                  Scrollable.ensureVisible(
                                      nameKey.currentContext!);
                                }
                              }
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  onSubmit() async {
    final nameCourse = nameTextController.text;
    final typeCourse = typeTextController.text;
    final priceCourse = priceTextController.text;
    final detailCourse = detailTextController.text;
    try {
      await _bloc.createCourse(
          nameCourse, typeCourse, priceCourse, detailCourse);

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => RootPage()),
          (route) => false);
    } catch (e) {
      print("Error");
    }
  }
}
