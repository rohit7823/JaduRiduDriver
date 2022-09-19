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
