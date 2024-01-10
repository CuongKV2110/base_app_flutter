import 'package:freezed_annotation/freezed_annotation.dart';

import '../entities/menu_item_entity.dart';
part 'menu_item_dto.g.dart';

@JsonSerializable()
class MenuItemDto extends MenuItemEntity {
  @override
  int id;
  @override
  String type;
  @override
  String name;
  @override
  String detail;
  @override
  String price;
  @override
  int quantity;
  @override
  bool sale;
  @override
  bool favorite;

  MenuItemDto(
      {required this.id,
      required this.type,
      required this.name,
      required this.detail,
      required this.price,
      required this.quantity,
      required this.sale,
      required this.favorite});

  factory MenuItemDto.fromJson(Map<String, dynamic> json) =>
      _$MenuItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MenuItemDtoToJson(this);
}
