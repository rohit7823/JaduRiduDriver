// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_call_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _BatchCallApi implements BatchCallApi {
  _BatchCallApi(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<BatchCallResponse> batchCallForIntroData(requestedApi) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'requested_api': requestedApi};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BatchCallResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/driver/batchCall',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BatchCallResponse.fromJsonIntro(_result.data!);
    return value;
  }

  @override
  Future<BatchCallResponse> batchCallForRegistrationData(requestedApi) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'requested_api': requestedApi};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BatchCallResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/driver/batchCall',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BatchCallResponse.fromJsonRegistration(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
