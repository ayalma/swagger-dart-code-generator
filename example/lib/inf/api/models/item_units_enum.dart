import 'package:json_annotation/json_annotation.dart';
enum ItemUnits {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('Weight')
  weight,
  @JsonValue('Liter')
  liter,
  @JsonValue('Countable')
  countable,
  @JsonValue('Box')
  box,
  @JsonValue('Twelvepacks')
  twelvepacks,
  @JsonValue('Glasspack')
  glasspack
}

const $ItemUnitsMap = {
  ItemUnits.weight: 'Weight',
  ItemUnits.liter: 'Liter',
  ItemUnits.countable: 'Countable',
  ItemUnits.box: 'Box',
  ItemUnits.twelvepacks: 'Twelvepacks',
  ItemUnits.glasspack: 'Glasspack'
};

