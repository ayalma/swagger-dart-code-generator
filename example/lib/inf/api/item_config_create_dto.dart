import 'package:json_annotation/json_annotation.dart';
part 'item_config_create_dto.g.dart';
@JsonSerializable(explicitToJson: true)
class ItemConfigCreateDto {
  ItemConfigCreateDto({
    this.safetyStock,
    this.purchaseOrderCeiling,
    this.buyOffer,
  });

  factory ItemConfigCreateDto.fromJson(Map<String, dynamic> json) =>
      _$ItemConfigCreateDtoFromJson(json);

  @JsonKey(name: 'safetyStock', includeIfNull: false)
  final num? safetyStock;
  @JsonKey(name: 'purchaseOrderCeiling', includeIfNull: false)
  final num? purchaseOrderCeiling;
  @JsonKey(name: 'buyOffer', includeIfNull: false)
  final int? buyOffer;
  Map<String, dynamic> toJson() => _$ItemConfigCreateDtoToJson(this);
}

extension $ItemConfigCreateDtoExtension on ItemConfigCreateDto {
  ItemConfigCreateDto copyWith(
      {num? safetyStock, num? purchaseOrderCeiling, int? buyOffer}) {
    return ItemConfigCreateDto(
        safetyStock: safetyStock ?? this.safetyStock,
        purchaseOrderCeiling: purchaseOrderCeiling ?? this.purchaseOrderCeiling,
        buyOffer: buyOffer ?? this.buyOffer);
  }
}

