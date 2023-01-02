// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_permit_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _VehiclePermitApi implements VehiclePermitApi {
  _VehiclePermitApi(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<UploadVehiclePermitResponse> vehiclePermit(
    userId,
    documentNumber,
    documentImage,
    expiryDate,
    validPermit,
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
      'validPermit',
      validPermit,
    ));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UploadVehiclePermitResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
                _dio.options, '/driver/users/${userId}/document/vehiclePermit',
                queryParameters: queryParameters,
                data: _data,
                onSendProgress: uploading)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UploadVehiclePermitResponse.fromJson(_result.data!);
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
