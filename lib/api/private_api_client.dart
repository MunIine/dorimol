import 'package:dio/dio.dart';
import 'package:dorimol/models/models.dart';
import 'package:retrofit/retrofit.dart';

part 'private_api_client.g.dart';

@RestApi(baseUrl: "")
abstract class PrivateApiClient {
  factory PrivateApiClient(Dio dio, {String baseUrl}) = _PrivateApiClient;
  factory PrivateApiClient.create({required Dio dio, String? apiUrl}){
    if (apiUrl != null) {
      return PrivateApiClient(dio, baseUrl: apiUrl);
    }
    return PrivateApiClient(dio);
  }

  @POST('/user/update')
  Future<JwtTokensAnwer> updateUser(@Body() Map<String, dynamic> body);

  @GET('/auth/validate')
  Future<void> validateToken();

  @GET('/user/me')
  Future<User> getCurrentUser();

  @GET('/user/me/orders')
  Future<List<OrderPreview>> getUserOrders();
}