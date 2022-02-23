import 'package:json_annotation/json_annotation.dart';
part 'item_unit_dto_model.g.dart';
@JsonSerializable(explicitToJson: true)
class ItemUnitDto {
  ItemUnitDto({
    this.id,
    this.title,
    this.description,
  });

  factory ItemUnitDto.fromJson(Map<String, dynamic> json) =>
      _$ItemUnitDtoFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'title', includeIfNull: false)
  final int? title;
  @JsonKey(name: 'description', includeIfNull: false)
  final int? description;
  Map<String, dynamic> toJson() => _$ItemUnitDtoToJson(this);
}

extension $ItemUnitDtoExtension on ItemUnitDto {
  ItemUnitDto copyWith({int? id, int? title, int? description}) {
    return ItemUnitDto(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description);
  }
}

