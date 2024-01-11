import 'package:base_app/module/models/dto/course_dto.dart';

abstract class DetailCourseState {}

class DetailCourseInitial extends DetailCourseState {}

class DetailCourseLoading extends DetailCourseState {}

class DetailCourseSuccess extends DetailCourseState {
  CourseDto courseDto;
  DetailCourseSuccess(this.courseDto);
}

class DetailCourseError extends DetailCourseState {}
