import 'package:json_annotation/json_annotation.dart';
part 'item_read_dto_app_result_model.g.dart';
@JsonSerializable(explicitToJson: true)
class ItemReadDtoAppResult {
  ItemReadDtoAppResult({
    this.data,
    this.isSuccessfull,
    this.error,
  });

  factory ItemReadDtoAppResult.fromJson(Map<String, dynamic> json) =>
      _$ItemReadDtoAppResultFromJson(json);

  @JsonKey(name: 'Data', includeIfNull: false)
  final ItemReadDto? data;
  @JsonKey(name: 'IsSuccessfull', includeIfNull: false)
  final bool? isSuccessfull;
  @JsonKey(name: 'Error', includeIfNull: false)
  final ApplicationError? error;
  Map<String, dynamic> toJson() => _$ItemReadDtoAppResultToJson(this);
}

extension $ItemReadDtoAppResultExtension on ItemReadDtoAppResult {
  ItemReadDtoAppResult copyWith(
      {ItemReadDto? data, bool? isSuccessfull, ApplicationError? error}) {
    return ItemReadDtoAppResult(
        data: data ?? this.data,
        isSuccessfull: isSuccessfull ?? this.isSuccessfull,
        error: error ?? this.error);
  }
}

