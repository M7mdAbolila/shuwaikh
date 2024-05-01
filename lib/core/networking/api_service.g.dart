// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ApiService implements ApiService {
  _ApiService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://shuwaikhcoffee.com/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<LoginResponse> login(LoginRequestBody loginRequestBody) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(loginRequestBody.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LoginResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'auth/login',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = LoginResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SignupResponse> signup(SignupRequestBody signupRequestBody) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(signupRequestBody.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<SignupResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'auth/register',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = SignupResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetCatogoriesResponse> getCategories(
      GetCategoriesRequsetBody getCategoriesRequsetBody) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Accept': 'application/json'};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(getCategoriesRequsetBody.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetCatogoriesResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'getCategories?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3NodXdhaWtoY29mZmVlLmNvbS9hcGkvYXV0aC9sb2dpbiIsImlhdCI6MTcxNDU2MDczOCwiZXhwIjoxNzE0NTY0MzM4LCJuYmYiOjE3MTQ1NjA3MzgsImp0aSI6InZhM0pkRFFEa01TSDhPUUwiLCJzdWIiOiIzMSIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.PYM4cigajifWbreHdZSOVfsCjzoebMapkYD0u36_5Q0',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = GetCatogoriesResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetOffersResponse> getOffers(
      GetOffersRequsetBody getOffersRequsetBody) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Accept': 'application/json'};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(getOffersRequsetBody.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<GetOffersResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'getOffers?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3NodXdhaWtoY29mZmVlLmNvbS9hcGkvYXV0aC9sb2dpbiIsImlhdCI6MTcxNDU2MDczOCwiZXhwIjoxNzE0NTY0MzM4LCJuYmYiOjE3MTQ1NjA3MzgsImp0aSI6InZhM0pkRFFEa01TSDhPUUwiLCJzdWIiOiIzMSIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.PYM4cigajifWbreHdZSOVfsCjzoebMapkYD0u36_5Q0',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = GetOffersResponse.fromJson(_result.data!);
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

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
