// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repair_request_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations

class _RepairRequestApi implements RepairRequestApi {
  _RepairRequestApi(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<BaseResponse<dynamic>> searchCustomer(
    Map<String, dynamic> body,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _options = _setStreamType<BaseResponse<dynamic>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/apiv1/data/findcustomers',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<dynamic> _value;
    try {
      _value = BaseResponse<dynamic>.fromJson(
        _result.data!,
        (json) => json as dynamic,
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<CloseRepairRequestResponse>> closeRepairRequest(
    Map<String, dynamic> body,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _options = _setStreamType<BaseResponse<CloseRepairRequestResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/RepairRequest/SetPostClosed',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<CloseRepairRequestResponse> _value;
    try {
      _value = BaseResponse<CloseRepairRequestResponse>.fromJson(
        _result.data!,
        (json) =>
            CloseRepairRequestResponse.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<RepairRequestListResponse>> getRepairRequestList(
    InstallationListPayload body,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    final _options = _setStreamType<BaseResponse<RepairRequestListResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/repairrequest/loaddata',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<RepairRequestListResponse> _value;
    try {
      _value = BaseResponse<RepairRequestListResponse>.fromJson(
        _result.data!,
        (json) =>
            RepairRequestListResponse.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<RepairRequestDetailResponse>> getRepairRequestDetail(
    InstallationDetailPayload body,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    final _options = _setStreamType<BaseResponse<RepairRequestDetailResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/repairrequest/editjson',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<RepairRequestDetailResponse> _value;
    try {
      _value = BaseResponse<RepairRequestDetailResponse>.fromJson(
        _result.data!,
        (json) =>
            RepairRequestDetailResponse.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<UpdateRepairRequestTechnicalStaffResponse>>
  addTechnicalStaffRepairRequest(Map<String, dynamic> body) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _options =
        _setStreamType<BaseResponse<UpdateRepairRequestTechnicalStaffResponse>>(
          Options(method: 'POST', headers: _headers, extra: _extra)
              .compose(
                _dio.options,
                '/repairrequest/addtechnicalstaff',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<UpdateRepairRequestTechnicalStaffResponse> _value;
    try {
      _value = BaseResponse<UpdateRepairRequestTechnicalStaffResponse>.fromJson(
        _result.data!,
        (json) => UpdateRepairRequestTechnicalStaffResponse.fromJson(
          json as Map<String, dynamic>,
        ),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<UpdateRepairRequestStep3Response>>
  updateRepairRequestStep3(Map<String, dynamic> body) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _options =
        _setStreamType<BaseResponse<UpdateRepairRequestStep3Response>>(
          Options(method: 'POST', headers: _headers, extra: _extra)
              .compose(
                _dio.options,
                '/RepairRequest/UpdateCurrentStep_3',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<UpdateRepairRequestStep3Response> _value;
    try {
      _value = BaseResponse<UpdateRepairRequestStep3Response>.fromJson(
        _result.data!,
        (json) => UpdateRepairRequestStep3Response.fromJson(
          json as Map<String, dynamic>,
        ),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<UpdateRepairRequestStep4Response>>
  uploadRepairRequestStep4({
    required String id,
    required String note,
    File? technicalStaffModuleImage,
    File? technicalStaffTestImage,
    File? technicalStaffImage,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('id', id));
    _data.fields.add(MapEntry('note', note));
    if (technicalStaffModuleImage != null) {
      if (technicalStaffModuleImage != null) {
        _data.files.add(
          MapEntry(
            'technicalStaffModuleImage[0]',
            MultipartFile.fromFileSync(
              technicalStaffModuleImage.path,
              filename: technicalStaffModuleImage.path
                  .split(Platform.pathSeparator)
                  .last,
            ),
          ),
        );
      }
    }
    if (technicalStaffTestImage != null) {
      if (technicalStaffTestImage != null) {
        _data.files.add(
          MapEntry(
            'technicalStaffTestImage[0]',
            MultipartFile.fromFileSync(
              technicalStaffTestImage.path,
              filename: technicalStaffTestImage.path
                  .split(Platform.pathSeparator)
                  .last,
            ),
          ),
        );
      }
    }
    if (technicalStaffImage != null) {
      if (technicalStaffImage != null) {
        _data.files.add(
          MapEntry(
            'technicalStaffImage[0]',
            MultipartFile.fromFileSync(
              technicalStaffImage.path,
              filename: technicalStaffImage.path
                  .split(Platform.pathSeparator)
                  .last,
            ),
          ),
        );
      }
    }
    final _options =
        _setStreamType<BaseResponse<UpdateRepairRequestStep4Response>>(
          Options(
                method: 'POST',
                headers: _headers,
                extra: _extra,
                contentType: 'multipart/form-data',
              )
              .compose(
                _dio.options,
                '/RepairRequest/UpdateCurrentStep_4',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<UpdateRepairRequestStep4Response> _value;
    try {
      _value = BaseResponse<UpdateRepairRequestStep4Response>.fromJson(
        _result.data!,
        (json) => UpdateRepairRequestStep4Response.fromJson(
          json as Map<String, dynamic>,
        ),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<dynamic>> addRepairRequestNote(
    Map<String, dynamic> body,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _options = _setStreamType<BaseResponse<dynamic>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/repairrequest/addnote',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<dynamic> _value;
    try {
      _value = BaseResponse<dynamic>.fromJson(
        _result.data!,
        (json) => json as dynamic,
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<NoteListResponse>> getRepairRequestNoteList(
    Map<String, dynamic> body,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _options = _setStreamType<BaseResponse<NoteListResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/repairrequest/getnote',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<NoteListResponse> _value;
    try {
      _value = BaseResponse<NoteListResponse>.fromJson(
        _result.data!,
        (json) => NoteListResponse.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<dynamic>> addRepairRequestOverdueNote(
    Map<String, dynamic> body,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _options = _setStreamType<BaseResponse<dynamic>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/repairrequest/AddOverdue',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<dynamic> _value;
    try {
      _value = BaseResponse<dynamic>.fromJson(
        _result.data!,
        (json) => json as dynamic,
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<NoteListResponse>> getRepairRequestOverdueNoteList(
    Map<String, dynamic> body,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _options = _setStreamType<BaseResponse<NoteListResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/repairrequest/GetOverdue',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<NoteListResponse> _value;
    try {
      _value = BaseResponse<NoteListResponse>.fromJson(
        _result.data!,
        (json) => NoteListResponse.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
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

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
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
