import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'item_api.g.dart';

@RestApi()
abstract class ItemApi {
  factory ItemApi(Dio dio, {String baseUrl}) = _ItemApi;

  ///
  @POST('/api/v1/Item')
  Future<GuidAppResult> createItem(
      {@Body() required CreateItemDto? body,
      @Body() required CreateItemDto? body$,
      @Body() required CreateItemDto? body$$});

  ///
  @PUT('/api/v1/Item')
  Future<BooleanAppResult> updateItem(
      {@Body() required UpdateItemDto? body,
      @Body() required UpdateItemDto? body$,
      @Body() required UpdateItemDto? body$$});

  ///
  ///@param itemUId
  @DELETE('/api/v1/Item/{itemUId}')
  Future<BooleanAppResult> deleteItem(
      {@Path('itemUId') required String itemUId});

  ///
  ///@param itemUId
  @GET('/api/v1/Item/{itemUId}')
  Future<ItemReadDtoAppResult> getItem(
      {@Path('itemUId') required String itemUId});

  ///
  @GET('/api/v1/Item/unit-types')
  Future<ItemUnitDtoIEnumerableAppResult> getItemUniTypes();

  ///
  ///@param SearchExpression
  ///@param pageNumber
  ///@param pageSize
  @GET('/api/v1/Item/all')
  Future<ItemReadDtoIEnumerableAppResult> getItems(
      {@Query('SearchExpression') String? searchExpression,
      @Query('pageNumber') int? pageNumber,
      @Query('pageSize') int? pageSize});

  ///
  ///@param rowVersion
  @GET('/api/v1/Item/sync')
  Future<ItemReadDtoIEnumerableAppResult> getLatestChanges(
      {@Query('rowVersion') String? rowVersion});
}
