import 'package:json_annotation/json_annotation.dart';
part 'item_config_update_dto.g.dart';
@JsonSerializable(explicitToJson: true)
class ItemConfigUpdateDto {
  ItemConfigUpdateDto({
    this.uId,
    this.safetyStock,
    this.purchaseOrderCeiling,
    this.buyOffer,
  });

  factory ItemConfigUpdateDto.fromJson(Map<String, dynamic> json) =>
      _$ItemConfigUpdateDtoFromJson(json);

  @JsonKey(name: 'uId', includeIfNull: false, defaultValue: '')
  final String? uId;
  @JsonKey(name: 'safetyStock', includeIfNull: false)
  final num? safetyStock;
  @JsonKey(name: 'purchaseOrderCeiling', includeIfNull: false)
  final num? purchaseOrderCeiling;
  @JsonKey(name: 'buyOffer', includeIfNull: false)
  final int? buyOffer;
  Map<String, dynamic> toJson() => _$ItemConfigUpdateDtoToJson(this);
}

extension $ItemConfigUpdateDtoExtension on ItemConfigUpdateDto {
  ItemConfigUpdateDto copyWith(
      {String? uId,
      num? safetyStock,
      num? purchaseOrderCeiling,
      int? buyOffer}) {
    return ItemConfigUpdateDto(
        uId: uId ?? this.uId,
        safetyStock: safetyStock ?? this.safetyStock,
        purchaseOrderCeiling: purchaseOrderCeiling ?? this.purchaseOrderCeiling,
        buyOffer: buyOffer ?? this.buyOffer);
  }
}

