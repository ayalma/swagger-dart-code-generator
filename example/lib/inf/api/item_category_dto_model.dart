import 'package:json_annotation/json_annotation.dart';
part 'item_category_dto_model.g.dart';
@JsonSerializable(explicitToJson: true)
class ItemCategoryDto {
  ItemCategoryDto({
    this.id,
    this.title,
    this.description,
  });

  factory ItemCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$ItemCategoryDtoFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false, defaultValue: '')
  final String? id;
  @JsonKey(name: 'title', includeIfNull: false, defaultValue: '')
  final String? title;
  @JsonKey(name: 'description', includeIfNull: false, defaultValue: '')
  final String? description;
  Map<String, dynamic> toJson() => _$ItemCategoryDtoToJson(this);
}

extension $ItemCategoryDtoExtension on ItemCategoryDto {
  ItemCategoryDto copyWith({String? id, String? title, String? description}) {
    return ItemCategoryDto(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description);
  }
}

