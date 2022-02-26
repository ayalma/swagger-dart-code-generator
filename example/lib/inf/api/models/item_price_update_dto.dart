import 'package:json_annotation/json_annotation.dart';
part 'item_price_update_dto.g.dart';
@JsonSerializable(explicitToJson: true)
class ItemPriceUpdateDto {
  ItemPriceUpdateDto({
    this.uId,
    this.purchasePrice,
    this.salePrice,
  });

  factory ItemPriceUpdateDto.fromJson(Map<String, dynamic> json) =>
      _$ItemPriceUpdateDtoFromJson(json);

  @JsonKey(name: 'uId', includeIfNull: false, defaultValue: '')
  final String? uId;
  @JsonKey(name: 'purchasePrice', includeIfNull: false)
  final num? purchasePrice;
  @JsonKey(name: 'salePrice', includeIfNull: false)
  final num? salePrice;
  Map<String, dynamic> toJson() => _$ItemPriceUpdateDtoToJson(this);
}

extension $ItemPriceUpdateDtoExtension on ItemPriceUpdateDto {
  ItemPriceUpdateDto copyWith(
      {String? uId, num? purchasePrice, num? salePrice}) {
    return ItemPriceUpdateDto(
        uId: uId ?? this.uId,
        purchasePrice: purchasePrice ?? this.purchasePrice,
        salePrice: salePrice ?? this.salePrice);
  }
}

