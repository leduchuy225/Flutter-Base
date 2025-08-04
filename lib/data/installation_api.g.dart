// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'installation_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations

class _InstallationApi implements InstallationApi {
  _InstallationApi(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<BaseResponse<CloseNewInstallationResponse>> closeNewInstallation(
    Map<String, dynamic> body,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _options = _setStreamType<BaseResponse<CloseNewInstallationResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/newconnectionrequest/SetPostClosed',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<CloseNewInstallationResponse> _value;
    try {
      _value = BaseResponse<CloseNewInstallationResponse>.fromJson(
        _result.data!,
        (json) =>
            CloseNewInstallationResponse.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<InstallationListResponse>> getNewInstallationList(
    InstallationListPayload body,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    final _options = _setStreamType<BaseResponse<InstallationListResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/NewConnectionRequest/LoadData',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<InstallationListResponse> _value;
    try {
      _value = BaseResponse<InstallationListResponse>.fromJson(
        _result.data!,
        (json) =>
            InstallationListResponse.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<InstallationDetailResponse>> getNewInstallationDetail(
    InstallationDetailPayload body,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    final _options = _setStreamType<BaseResponse<InstallationDetailResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/NewConnectionRequest/editjson',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<InstallationDetailResponse> _value;
    try {
      _value = BaseResponse<InstallationDetailResponse>.fromJson(
        _result.data!,
        (json) =>
            InstallationDetailResponse.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<TechnicalStaffListResponse>> getTechnicalStaffList(
    TechnicalStaffListPayload body,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    final _options = _setStreamType<BaseResponse<TechnicalStaffListResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/apiv1/data/getlisttechnicalstaff',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<TechnicalStaffListResponse> _value;
    try {
      _value = BaseResponse<TechnicalStaffListResponse>.fromJson(
        _result.data!,
        (json) =>
            TechnicalStaffListResponse.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseResponse<UpdateNewInstallationTechnicalStaffResponse>>
  addTechnicalStaffNewInstallation(Map<String, dynamic> body) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _options =
        _setStreamType<
          BaseResponse<UpdateNewInstallationTechnicalStaffResponse>
        >(
          Options(method: 'POST', headers: _headers, extra: _extra)
              .compose(
                _dio.options,
                '/NewConnectionRequest/addtechnicalstaff',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<UpdateNewInstallationTechnicalStaffResponse> _value;
    try {
      _value =
          BaseResponse<UpdateNewInstallationTechnicalStaffResponse>.fromJson(
            _result.data!,
            (json) => UpdateNewInstallationTechnicalStaffResponse.fromJson(
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
  Future<BaseResponse<UpdateNewInstallationStep3Response>>
  updateNewInstallationStep3(Map<String, dynamic> body) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _options =
        _setStreamType<BaseResponse<UpdateNewInstallationStep3Response>>(
          Options(method: 'POST', headers: _headers, extra: _extra)
              .compose(
                _dio.options,
                '/NewConnectionRequest/UpdateCurrentStep_3',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<UpdateNewInstallationStep3Response> _value;
    try {
      _value = BaseResponse<UpdateNewInstallationStep3Response>.fromJson(
        _result.data!,
        (json) => UpdateNewInstallationStep3Response.fromJson(
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
  Future<BaseResponse<UpdateNewInstallationStep4Response>>
  uploadNewInstallationStep4({
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
        _setStreamType<BaseResponse<UpdateNewInstallationStep4Response>>(
          Options(
                method: 'POST',
                headers: _headers,
                extra: _extra,
                contentType: 'multipart/form-data',
              )
              .compose(
                _dio.options,
                '/NewConnectionRequest/UpdateCurrentStep_4',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<UpdateNewInstallationStep4Response> _value;
    try {
      _value = BaseResponse<UpdateNewInstallationStep4Response>.fromJson(
        _result.data!,
        (json) => UpdateNewInstallationStep4Response.fromJson(
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
  Future<BaseResponse<dynamic>> addNewInstallationNote(
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
            '/newconnectionrequest/addnote',
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
  Future<BaseResponse<NoteListResponse>> getNewInstallationNoteList(
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
            '/newconnectionrequest/getnote',
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
  Future<BaseResponse<dynamic>> addNewInstallationOverdueNote(
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
            '/newconnectionrequest/AddOverdue',
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
  Future<BaseResponse<NoteListResponse>> getNewInstallationOverdueNoteList(
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
            '/newconnectionrequest/GetOverdue',
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
  Future<BaseResponse<InstallationReportFileListResponse>>
  getInstallationReportFileList(Map<String, dynamic> body) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _options =
        _setStreamType<BaseResponse<InstallationReportFileListResponse>>(
          Options(method: 'POST', headers: _headers, extra: _extra)
              .compose(
                _dio.options,
                '/newconnectionrequest/GetReport',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<InstallationReportFileListResponse> _value;
    try {
      _value = BaseResponse<InstallationReportFileListResponse>.fromJson(
        _result.data!,
        (json) => InstallationReportFileListResponse.fromJson(
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
  Future<BaseResponse<ViewInstallationReportFileResponse>>
  viewInstallationReportFile(ViewInstallationReportFilePayload body) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    final _options =
        _setStreamType<BaseResponse<ViewInstallationReportFileResponse>>(
          Options(method: 'POST', headers: _headers, extra: _extra)
              .compose(
                _dio.options,
                '/newconnectionrequest/SetReport',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<ViewInstallationReportFileResponse> _value;
    try {
      _value = BaseResponse<ViewInstallationReportFileResponse>.fromJson(
        _result.data!,
        (json) => ViewInstallationReportFileResponse.fromJson(
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
  Future<BaseResponse<SignInstallationReportFileResponse>>
  signInstallationReportFile({
    required String id,
    required String type,
    File? customersSign,
    File? technicalStaffSign,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('id', id));
    _data.fields.add(MapEntry('type', type));
    if (customersSign != null) {
      if (customersSign != null) {
        _data.files.add(
          MapEntry(
            'customersSign[0]',
            MultipartFile.fromFileSync(
              customersSign.path,
              filename: customersSign.path.split(Platform.pathSeparator).last,
            ),
          ),
        );
      }
    }
    if (technicalStaffSign != null) {
      if (technicalStaffSign != null) {
        _data.files.add(
          MapEntry(
            'technicalStaffSign[0]',
            MultipartFile.fromFileSync(
              technicalStaffSign.path,
              filename: technicalStaffSign.path
                  .split(Platform.pathSeparator)
                  .last,
            ),
          ),
        );
      }
    }
    final _options =
        _setStreamType<BaseResponse<SignInstallationReportFileResponse>>(
          Options(
                method: 'POST',
                headers: _headers,
                extra: _extra,
                contentType: 'multipart/form-data',
              )
              .compose(
                _dio.options,
                '/newconnectionrequest/SignReport',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseResponse<SignInstallationReportFileResponse> _value;
    try {
      _value = BaseResponse<SignInstallationReportFileResponse>.fromJson(
        _result.data!,
        (json) => SignInstallationReportFileResponse.fromJson(
          json as Map<String, dynamic>,
        ),
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
