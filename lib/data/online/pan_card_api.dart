import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'pan_card_api.g.dart';

@RestApi()
abstract class PanCardApi {
  factory PanCardApi(Dio dio, {String baseUrl}) = _PanCardApi;
}
