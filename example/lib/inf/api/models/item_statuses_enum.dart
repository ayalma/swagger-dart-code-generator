import 'package:json_annotation/json_annotation.dart';
enum ItemStatuses {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('Active')
  active,
  @JsonValue('Inactive')
  inactive,
  @JsonValue('Draft')
  draft
}

const $ItemStatusesMap = {
  ItemStatuses.active: 'Active',
  ItemStatuses.inactive: 'Inactive',
  ItemStatuses.draft: 'Draft'
};

