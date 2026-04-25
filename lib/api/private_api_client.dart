import 'dart:io';
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

  @GET('/user/me')
  Future<User> getCurrentUser();

  @GET('/user/me/orders')
  Future<UserOrdersResponse> getUserOrders(@Query("offset") int offset, @Query("limit") int limit);

  @PATCH('/user/update')
  Future<User> updateUser(@Body() Map<String, dynamic> body);

  @MultiPart()
  @POST('/user/update/avatar')
  Future<User> updateUserAvatar(@Part(name: "avatar") File avatar);

  @POST('/orders/add')
  Future<void> addOrder(@Body() OrderAdd body);

  @GET('/auth/validate')
  Future<void> validateToken();

  @POST('/auth/refresh')
  Future<JwtTokensAnwer> refreshToken();
}