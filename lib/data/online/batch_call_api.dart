import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'batch_call_api.g.dart';

@RestApi()
abstract class BatchCallApi {
  factory BatchCallApi(Dio dio, {String baseUrl}) = _BatchCallApi;
}
