import 'package:json_annotation/json_annotation.dart';
part 'create_item_dto_model.g.dart';
@JsonSerializable(explicitToJson: true)
class CreateItemDto {
  CreateItemDto({
    this.name,
    this.fullName,
    this.type,
    this.unitType,
    this.categoryUId,
    this.barcode,
    this.brand,
    this.stock,
    this.config,
    this.itemPrice,
  });

  factory CreateItemDto.fromJson(Map<String, dynamic> json) =>
      _$CreateItemDtoFromJson(json);

  @JsonKey(name: 'name', includeIfNull: false, defaultValue: '')
  final String? name;
  @JsonKey(name: 'fullName', includeIfNull: false, defaultValue: '')
  final String? fullName;
  @JsonKey(
      name: 'type',
      includeIfNull: false,
      toJson: itemTypesToJson,
      fromJson: itemTypesFromJson)
  final enums.ItemTypes? type;
  @JsonKey(
      name: 'unitType',
      includeIfNull: false,
      toJson: itemUnitsToJson,
      fromJson: itemUnitsFromJson)
  final enums.ItemUnits? unitType;
  @JsonKey(name: 'categoryUId', includeIfNull: false, defaultValue: '')
  final String? categoryUId;
  @JsonKey(name: 'barcode', includeIfNull: false, defaultValue: '')
  final String? barcode;
  @JsonKey(name: 'brand', includeIfNull: false, defaultValue: '')
  final String? brand;
  @JsonKey(name: 'stock', includeIfNull: false)
  final int? stock;
  @JsonKey(name: 'config', includeIfNull: false)
  final ItemConfigCreateDto? config;
  @JsonKey(name: 'itemPrice', includeIfNull: false)
  final ItemPriceCreateDto? itemPrice;
  Map<String, dynamic> toJson() => _$CreateItemDtoToJson(this);
}

extension $CreateItemDtoExtension on CreateItemDto {
  CreateItemDto copyWith(
      {String? name,
      String? fullName,
      enums.ItemTypes? type,
      enums.ItemUnits? unitType,
      String? categoryUId,
      String? barcode,
      String? brand,
      int? stock,
      ItemConfigCreateDto? config,
      ItemPriceCreateDto? itemPrice}) {
    return CreateItemDto(
        name: name ?? this.name,
        fullName: fullName ?? this.fullName,
        type: type ?? this.type,
        unitType: unitType ?? this.unitType,
        categoryUId: categoryUId ?? this.categoryUId,
        barcode: barcode ?? this.barcode,
        brand: brand ?? this.brand,
        stock: stock ?? this.stock,
        config: config ?? this.config,
        itemPrice: itemPrice ?? this.itemPrice);
  }
}

