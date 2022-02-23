import 'package:json_annotation/json_annotation.dart';
part 'create_store_dto_model.g.dart';
@JsonSerializable(explicitToJson: true)
class CreateStoreDto {
  CreateStoreDto();

  factory CreateStoreDto.fromJson(Map<String, dynamic> json) =>
      _$CreateStoreDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreateStoreDtoToJson(this);
}

