// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_license_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _DriverLicenseApi implements DriverLicenseApi {
  _DriverLicenseApi(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<UploadDriverLicenseResponse> driverLicense(
      userId, documentNumber, documentImage, expiaryDate, uploading) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('document_number', documentNumber));
    _data.files.add(MapEntry(
        'document_image',
        MultipartFile.fromFileSync(documentImage.path,
            filename: documentImage.path.split(Platform.pathSeparator).last)));
    _data.fields.add(MapEntry('expiary_date', expiaryDate));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UploadDriverLicenseResponse>(Options(
                method: 'POST',
                headers: _headers,
                extra: _extra,
                contentType: 'multipart/form-data')
            .compose(_dio.options, '/driver/users/${userId}/vehicleLicence',
                queryParameters: queryParameters,
                data: _data,
                onSendProgress: uploading)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UploadDriverLicenseResponse.fromJson(_result.data!);
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
