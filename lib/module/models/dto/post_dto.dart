import 'package:base_app/module/models/entities/post_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'post_dto.g.dart';

@JsonSerializable()
class PostDto extends PostEntity {
  @override
  int userId;
  @override
  int id;
  @override
  String title;
  @override
  String body;

  PostDto({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostDto.fromJson(Map<String, dynamic> json) =>
      _$PostDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PostDtoToJson(this);
}
