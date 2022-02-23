import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'file_api.g.dart';

@RestApi()
abstract class FileApi {
  factory FileApi(Dio dio, {String baseUrl}) = _FileApi;

  ///
  ///@param fileHashCode
  @POST('/api/v1/File/image/{fileHashCode}')
  @MultiPart()
  Future<String> uploadFile(
      {@Path('fileHashCode') required String fileHashCode,
      @Part(name: 'file') required dynamic file});

  ///
  ///@param id
  @GET('/api/v1/File/image/{id}')
  Future<void> downloadFile({@Path('id') required String id});
}
