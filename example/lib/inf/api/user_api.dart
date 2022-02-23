import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'user_api.g.dart';
@RestApi() abstract class UserApi {factory UserApi(Dio dio, {String baseUrl}) = _UserApi;

///
@POST('/api/v1/User/authenticate') Future<TokensAppResult> authenticate({@Body() required LoginRequest? body, @Body() required LoginRequest? body$, @Body() required LoginRequest? body$$});
 }

