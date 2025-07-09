import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/base_response.dart';
import '../models/installation/installation_detail_payload.dart';
import '../models/installation/installation_detail_response.dart';
import '../models/installation/installation_list_payload.dart';
import '../models/installation/installation_list_response.dart';

part 'installation_api.g.dart';

@RestApi()
abstract class InstallationApi {
  factory InstallationApi(Dio dio) = _InstallationApi;

  @POST('/NewConnectionRequest/LoadData')
  Future<BaseResponse<InstallationListResponse>> getNewInstallationList(
    @Body() InstallationListPayload body,
  );

  @POST('/NewConnectionRequest/editjson')
  Future<BaseResponse<InstallationDetailResponse>> getNewInstallationDetail(
    @Body() InstallationDetailPayload body,
  );
}
