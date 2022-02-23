import 'package:json_annotation/json_annotation.dart';
part 'create_item_category_dto_model.g.dart';
@JsonSerializable(explicitToJson: true)
class CreateItemCategoryDto {
  CreateItemCategoryDto({
    this.title,
    this.description,
  });

  factory CreateItemCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CreateItemCategoryDtoFromJson(json);

  @JsonKey(name: 'title', includeIfNull: false, defaultValue: '')
  final String? title;
  @JsonKey(name: 'description', includeIfNull: false, defaultValue: '')
  final String? description;
  Map<String, dynamic> toJson() => _$CreateItemCategoryDtoToJson(this);
}

extension $CreateItemCategoryDtoExtension on CreateItemCategoryDto {
  CreateItemCategoryDto copyWith({String? title, String? description}) {
    return CreateItemCategoryDto(
        title: title ?? this.title,
        description: description ?? this.description);
  }
}

