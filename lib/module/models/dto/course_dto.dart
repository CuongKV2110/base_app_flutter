import 'package:freezed_annotation/freezed_annotation.dart';

import '../entities/course_entity.dart';
part 'course_dto.g.dart';

@JsonSerializable()
class CourseDto extends CourseEntity {
  @override
  String id;
  @override
  String type;
  @override
  String name;
  @override
  String description;
  @override
  String price;
  @override
  String image;
  @override
  String userPost;
  @override
  String createdAt;
  @override
  bool? deleted;

  CourseDto({
    required this.id,
    required this.type,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.userPost,
    required this.createdAt,
    this.deleted,
  });

  factory CourseDto.fromJson(Map<String, dynamic> json) =>
      _$CourseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CourseDtoToJson(this);
}
