// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuItemDto _$MenuItemDtoFromJson(Map<String, dynamic> json) => MenuItemDto(
      id: json['id'] as int,
      type: json['type'] as String,
      name: json['name'] as String,
      detail: json['detail'] as String,
      price: json['price'] as String,
      quantity: json['quantity'] as int,
      sale: json['sale'] as bool,
      favorite: json['favorite'] as bool,
    );

Map<String, dynamic> _$MenuItemDtoToJson(MenuItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'detail': instance.detail,
      'price': instance.price,
      'quantity': instance.quantity,
      'sale': instance.sale,
      'favorite': instance.favorite,
    };
