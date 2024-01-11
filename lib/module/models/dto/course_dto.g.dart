// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseDto _$CourseDtoFromJson(Map<String, dynamic> json) => CourseDto(
      id: json['_id'] as String,
      type: json['type'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: json['price'] as String,
      image: json['image'] as String,
      deleted: json['deleted'] as bool?,
    );

Map<String, dynamic> _$CourseDtoToJson(CourseDto instance) => <String, dynamic>{
      '_id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'image': instance.image,
      'deleted': instance.deleted,
    };
