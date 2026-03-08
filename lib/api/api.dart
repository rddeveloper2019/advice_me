import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'models/single_advice_response.dart';
import 'models/search_advice_response.dart';

part 'api.g.dart';

@RestApi(baseUrl: '')
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @GET('/advice')
  Future<SingleAdviceResponse> getRandomAdvice();

  @GET('/advice/search/{term}')
  Future<SearchAdviceResponse> searchAdvice(@Path() String term);
}
