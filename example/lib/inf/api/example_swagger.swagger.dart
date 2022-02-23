import 'example_swagger.models.swagger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'example_swagger.enums.swagger.dart' as enums;
export 'example_swagger.enums.swagger.dart';
export 'example_swagger.models.swagger.dart';

part 'example_swagger.swagger.g.dart';

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}
