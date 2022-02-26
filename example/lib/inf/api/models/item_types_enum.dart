import 'package:json_annotation/json_annotation.dart';
enum ItemTypes {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('Good')
  good,
  @JsonValue('Service')
  service
}

const $ItemTypesMap = {ItemTypes.good: 'Good', ItemTypes.service: 'Service'};

