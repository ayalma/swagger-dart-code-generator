import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'stores_api.g.dart';
@RestApi() abstract class StoresApi {factory StoresApi(Dio dio, {String baseUrl}) = _StoresApi;

///
@POST('/api/v1/Stores') Future<GuidAppResult> createStore({@Body() required CreateStoreDto? body, @Body() required CreateStoreDto? body$, @Body() required CreateStoreDto? body$$});
///
@POST('/api/v1/Stores/category') Future<GuidAppResult> createStoreCategory({@Body() required CreateItemCategoryDto? body, @Body() required CreateItemCategoryDto? body$, @Body() required CreateItemCategoryDto? body$$});
 }

