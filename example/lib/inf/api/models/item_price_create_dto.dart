import 'package:json_annotation/json_annotation.dart';
part 'item_price_create_dto.g.dart';
@JsonSerializable(explicitToJson: true)
class ItemPriceCreateDto {
  ItemPriceCreateDto({
    this.purchasePrice,
    this.salePrice,
  });

  factory ItemPriceCreateDto.fromJson(Map<String, dynamic> json) =>
      _$ItemPriceCreateDtoFromJson(json);

  @JsonKey(name: 'purchasePrice', includeIfNull: false)
  final num? purchasePrice;
  @JsonKey(name: 'salePrice', includeIfNull: false)
  final num? salePrice;
  Map<String, dynamic> toJson() => _$ItemPriceCreateDtoToJson(this);
}

extension $ItemPriceCreateDtoExtension on ItemPriceCreateDto {
  ItemPriceCreateDto copyWith({num? purchasePrice, num? salePrice}) {
    return ItemPriceCreateDto(
        purchasePrice: purchasePrice ?? this.purchasePrice,
        salePrice: salePrice ?? this.salePrice);
  }
}

