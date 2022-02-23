import 'package:json_annotation/json_annotation.dart';
part 'update_item_dto_model.g.dart';
@JsonSerializable(explicitToJson: true)
class UpdateItemDto {
  UpdateItemDto({
    this.uId,
    this.name,
    this.fullName,
    this.type,
    this.unitType,
    this.categoryUId,
    this.barcode,
    this.brand,
    this.rowVersion,
    this.stock,
    this.config,
    this.itemPrice,
  });

  factory UpdateItemDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateItemDtoFromJson(json);

  @JsonKey(name: 'uId', includeIfNull: false, defaultValue: '')
  final String? uId;
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
  @JsonKey(name: 'rowVersion', includeIfNull: false, defaultValue: '')
  final String? rowVersion;
  @JsonKey(name: 'stock', includeIfNull: false)
  final int? stock;
  @JsonKey(name: 'config', includeIfNull: false)
  final ItemConfigUpdateDto? config;
  @JsonKey(name: 'itemPrice', includeIfNull: false)
  final ItemPriceUpdateDto? itemPrice;
  Map<String, dynamic> toJson() => _$UpdateItemDtoToJson(this);
}

extension $UpdateItemDtoExtension on UpdateItemDto {
  UpdateItemDto copyWith(
      {String? uId,
      String? name,
      String? fullName,
      enums.ItemTypes? type,
      enums.ItemUnits? unitType,
      String? categoryUId,
      String? barcode,
      String? brand,
      String? rowVersion,
      int? stock,
      ItemConfigUpdateDto? config,
      ItemPriceUpdateDto? itemPrice}) {
    return UpdateItemDto(
        uId: uId ?? this.uId,
        name: name ?? this.name,
        fullName: fullName ?? this.fullName,
        type: type ?? this.type,
        unitType: unitType ?? this.unitType,
        categoryUId: categoryUId ?? this.categoryUId,
        barcode: barcode ?? this.barcode,
        brand: brand ?? this.brand,
        rowVersion: rowVersion ?? this.rowVersion,
        stock: stock ?? this.stock,
        config: config ?? this.config,
        itemPrice: itemPrice ?? this.itemPrice);
  }
}

