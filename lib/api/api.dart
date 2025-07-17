import 'package:dio/dio.dart';
import 'package:dorimol/api/models/category.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi(baseUrl: "")
abstract class DorimolApiClient {
  factory DorimolApiClient(Dio dio, {String baseUrl}) = _DorimolApiClient;
  factory DorimolApiClient.create({String? apiUrl}){
    final dio = Dio();
    if (apiUrl != null) {
      return DorimolApiClient(dio, baseUrl: apiUrl);
    }
    return DorimolApiClient(dio);
  }

  @GET('/categories')
  Future<List<Category>> fetchCategories();
}