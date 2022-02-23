import 'package:json_annotation/json_annotation.dart';
part 'item_read_dto.g.dart';
@JsonSerializable(explicitToJson: true)
class ItemReadDto {
  ItemReadDto({
    this.uId,
    this.name,
    this.fullName,
    this.type,
    this.unitType,
    this.category,
    this.status,
    this.barcode,
    this.brand,
    this.rowVersion,
    this.stock,
    this.config,
    this.itemPrice,
  });

  factory ItemReadDto.fromJson(Map<String, dynamic> json) =>
      _$ItemReadDtoFromJson(json);

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
  @JsonKey(name: 'category', includeIfNull: false)
  final ItemCategoryDto? category;
  @JsonKey(
      name: 'status',
      includeIfNull: false,
      toJson: itemStatusesToJson,
      fromJson: itemStatusesFromJson)
  final enums.ItemStatuses? status;
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
  Map<String, dynamic> toJson() => _$ItemReadDtoToJson(this);
}

extension $ItemReadDtoExtension on ItemReadDto {
  ItemReadDto copyWith(
      {String? uId,
      String? name,
      String? fullName,
      enums.ItemTypes? type,
      enums.ItemUnits? unitType,
      ItemCategoryDto? category,
      enums.ItemStatuses? status,
      String? barcode,
      String? brand,
      String? rowVersion,
      int? stock,
      ItemConfigUpdateDto? config,
      ItemPriceUpdateDto? itemPrice}) {
    return ItemReadDto(
        uId: uId ?? this.uId,
        name: name ?? this.name,
        fullName: fullName ?? this.fullName,
        type: type ?? this.type,
        unitType: unitType ?? this.unitType,
        category: category ?? this.category,
        status: status ?? this.status,
        barcode: barcode ?? this.barcode,
        brand: brand ?? this.brand,
        rowVersion: rowVersion ?? this.rowVersion,
        stock: stock ?? this.stock,
        config: config ?? this.config,
        itemPrice: itemPrice ?? this.itemPrice);
  }
}

