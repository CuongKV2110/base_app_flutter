import 'package:base_app/module/models/dto/course_dto.dart';
import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../module/blocs/edit_course_bloc/edit_course_bloc.dart';
import '../../widget/app_button.dart';
import '../../widget/app_input.dart';
import '../../widget/appbar_widget.dart';
import '../../widget/keyboard_dismiss.dart';
import '../root_page/root_page.dart';

class EditCoursePage extends StatefulWidget {
  final CourseDto courseDto;
  const EditCoursePage({Key? key, required this.courseDto}) : super(key: key);

  @override
  State<EditCoursePage> createState() => _EditCoursePageState();
}

class _EditCoursePageState extends State<EditCoursePage> {
  final EditCourseBloc _bloc = EditCourseBloc();
  final _formKey = GlobalKey<FormState>();
  final nameTextController = TextEditingController();
  final typeTextController = TextEditingController();
  final priceTextController = TextEditingController();
  final imageTextController = TextEditingController();
  final descriptionTextController = TextEditingController();
  final nameKey = GlobalKey();
  final typeKey = GlobalKey();
  final priceKey = GlobalKey();
  final descriptionKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    nameTextController.text = widget.courseDto.name;
    typeTextController.text = widget.courseDto.type;
    priceTextController.text = widget.courseDto.price;
    imageTextController.text = widget.courseDto.image;
    descriptionTextController.text = widget.courseDto.name;
  }

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
                        controller: descriptionTextController,
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
                            title: 'Cập nhật',
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
    final imageCourse = imageTextController.text;
    final descriptionCourse = descriptionTextController.text;
    final CourseDto courseUpdate = CourseDto(
        id: widget.courseDto.id,
        type: typeCourse,
        name: nameCourse,
        description: descriptionCourse,
        price: priceCourse,
        image: imageCourse);
    try {
      bool success = await _bloc.updateCourse(courseUpdate);
      if (success) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => RootPage()),
            (route) => false);
      } else {
        print('Error');
      }
    } catch (e) {
      print("Error");
    }
  }
}
