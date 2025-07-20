import 'package:dio/dio.dart';
import 'package:dorimol/api/models/category.dart';
import 'package:dorimol/api/models/order.dart';
import 'package:dorimol/api/models/product.dart';
import 'package:dorimol/api/models/product_details.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi(baseUrl: "")
abstract class DorimolApiClient {
  factory DorimolApiClient(Dio dio, {String baseUrl}) = _DorimolApiClient;
  factory DorimolApiClient.create({required Dio dio, String? apiUrl}){
    if (apiUrl != null) {
      return DorimolApiClient(dio, baseUrl: apiUrl);
    }
    return DorimolApiClient(dio);
  }

  @GET('/categories')
  Future<List<Category>> fetchCategories();
  
  @GET('/products/')
  Future<List<Product>> fetchProductsByCategory(@Query("category_id") int categoryId, @Query("sorting") String sorting);
  
  @GET('/products/')
  Future<List<Product>> fetchProductsById(@Query("id") String id, @Query("sorting") String sorting);
  
  @GET('/products/')
  Future<List<Product>> fetchProductsByName(@Query("name") String name, @Query("sorting") String sorting);
  
  @GET('/products')
  Future<List<Product>> fetchSimilarProducts(@Query("similar") String id, @Query("sorting") String sorting);

  @GET('/products/{id}')
  Future<ProductDetails> fetchProductDetails(@Path("id") String productId);

  @POST('/orders/add')
  Future<HttpResponse> placeOrder(@Body() Order body);
}