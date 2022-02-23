import 'package:json_annotation/json_annotation.dart';
part 'item_unit_dto_i_enumerable_app_result.g.dart';
@JsonSerializable(explicitToJson: true)
class ItemUnitDtoIEnumerableAppResult {
  ItemUnitDtoIEnumerableAppResult({
    this.data,
    this.isSuccessfull,
    this.error,
  });

  factory ItemUnitDtoIEnumerableAppResult.fromJson(Map<String, dynamic> json) =>
      _$ItemUnitDtoIEnumerableAppResultFromJson(json);

  @JsonKey(name: 'Data', includeIfNull: false, defaultValue: <ItemUnitDto>[])
  final List<ItemUnitDto>? data;
  @JsonKey(name: 'IsSuccessfull', includeIfNull: false)
  final bool? isSuccessfull;
  @JsonKey(name: 'Error', includeIfNull: false)
  final ApplicationError? error;
  Map<String, dynamic> toJson() =>
      _$ItemUnitDtoIEnumerableAppResultToJson(this);
}

extension $ItemUnitDtoIEnumerableAppResultExtension
    on ItemUnitDtoIEnumerableAppResult {
  ItemUnitDtoIEnumerableAppResult copyWith(
      {List<ItemUnitDto>? data, bool? isSuccessfull, ApplicationError? error}) {
    return ItemUnitDtoIEnumerableAppResult(
        data: data ?? this.data,
        isSuccessfull: isSuccessfull ?? this.isSuccessfull,
        error: error ?? this.error);
  }
}

