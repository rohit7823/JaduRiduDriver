// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_insurance_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _VehicleInsuranceApi implements VehicleInsuranceApi {
  _VehicleInsuranceApi(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<UploadInsuranceResponse> addVehicleInsurance(
    userId,
    documentNumber,
    documentImage,
    expiryDate,
    isValid,
    uploading,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'document_number',
      documentNumber,
    ));
    _data.files.add(MapEntry(
      'document_image',
      MultipartFile.fromFileSync(
        documentImage.path,
        filename: documentImage.path.split(Platform.pathSeparator).last,
      ),
    ));
    _data.fields.add(MapEntry(
      'expiary_date',
      expiryDate,
    ));
    _data.fields.add(MapEntry(
      'validInsurance',
      isValid,
    ));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UploadInsuranceResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(_dio.options,
                '/driver/users/${userId}/document/vehicleInsurance',
                queryParameters: queryParameters,
                data: _data,
                onSendProgress: uploading)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UploadInsuranceResponse.fromJson(_result.data!);
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
