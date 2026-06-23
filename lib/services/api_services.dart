import 'package:dio/dio.dart';
import 'package:latihan_flutter_dasar/models/post_models.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: 'https://api.coingecko.com/api/v3')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/coins/markets?vs_currency=idr')
  Future<List<PostModels>> getAllPosts(@Query('vs_currency') String currency);
}
