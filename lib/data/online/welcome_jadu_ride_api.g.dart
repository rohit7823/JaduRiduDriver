// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'welcome_jadu_ride_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _WelcomeJaduRideApi implements WelcomeJaduRideApi {
  _WelcomeJaduRideApi(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<UserPrimaryRegistrationResponse> driverDetails(
    userId,
    userName,
    userEmail,
    refferalCode,
    stateID,
    districtId,
    cityId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'name': userName,
      'email': userEmail,
      'refferal_code': refferalCode,
      'state_id': stateID,
      'district_id': districtId,
      'city_id': cityId,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserPrimaryRegistrationResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
            .compose(
              _dio.options,
              '/driver/users/${userId}/details',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserPrimaryRegistrationResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DistrictsResponse> districts(stateId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'state_id': stateId};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<DistrictsResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/driver/districts',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DistrictsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CitiesResponse> cities(districtId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'district_id': districtId};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<CitiesResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/driver/cities',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CitiesResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RequiredDataWelcomeJaduRideResponse> initialData(userId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RequiredDataWelcomeJaduRideResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/driver/users/${userId}/requiredDataInRegistration',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RequiredDataWelcomeJaduRideResponse.fromJson(_result.data!);
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
