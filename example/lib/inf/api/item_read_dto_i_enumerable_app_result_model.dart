import 'package:json_annotation/json_annotation.dart';
part 'item_read_dto_i_enumerable_app_result_model.g.dart';
@JsonSerializable(explicitToJson: true)
class ItemReadDtoIEnumerableAppResult {
  ItemReadDtoIEnumerableAppResult({
    this.data,
    this.isSuccessfull,
    this.error,
  });

  factory ItemReadDtoIEnumerableAppResult.fromJson(Map<String, dynamic> json) =>
      _$ItemReadDtoIEnumerableAppResultFromJson(json);

  @JsonKey(name: 'Data', includeIfNull: false, defaultValue: <ItemReadDto>[])
  final List<ItemReadDto>? data;
  @JsonKey(name: 'IsSuccessfull', includeIfNull: false)
  final bool? isSuccessfull;
  @JsonKey(name: 'Error', includeIfNull: false)
  final ApplicationError? error;
  Map<String, dynamic> toJson() =>
      _$ItemReadDtoIEnumerableAppResultToJson(this);
}

extension $ItemReadDtoIEnumerableAppResultExtension
    on ItemReadDtoIEnumerableAppResult {
  ItemReadDtoIEnumerableAppResult copyWith(
      {List<ItemReadDto>? data, bool? isSuccessfull, ApplicationError? error}) {
    return ItemReadDtoIEnumerableAppResult(
        data: data ?? this.data,
        isSuccessfull: isSuccessfull ?? this.isSuccessfull,
        error: error ?? this.error);
  }
}

