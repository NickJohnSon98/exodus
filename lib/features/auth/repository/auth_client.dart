import 'package:dio/dio.dart';
import 'package:exodus/features/auth/repository/models/empty.dart';
import 'package:exodus/features/diagrammes/domain/diagram.dart';
import 'package:retrofit/retrofit.dart';

import '../../../domain/object/single_response_body.dart';
import '../domain/models/user_entity.dart';
import 'domain/register/register_body.dart';

part 'auth_client.g.dart';

@RestApi()
abstract class AuthClient {
  factory AuthClient(Dio dio, {String? baseUrl}) = _AuthClient;

  @POST('/date/spot/board')
  Future<HttpResponse<SingleResponseBody<UserEntity>>> register(
    @Body() RegisterBody body,
  );

  @GET('/{address}/getChart/{period}')
  Future<HttpResponse<SingleResponseBody<DiagramEntity>>> periods(
    @Path("address") String address,
    @Path("period") String period,
  );

  @GET('/check')
  Future<HttpResponse<SingleResponseBody<EmptyEntity>>> check();
}
