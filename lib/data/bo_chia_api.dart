import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/base_response.dart';
import '../models/bo_chia/bo_chia_list_payload.dart';
import '../models/bo_chia/bo_chia_list_response.dart';
import '../models/bo_chia/divider_view_used_port_response.dart';

part 'bo_chia_api.g.dart';

@RestApi()
abstract class BoChiaApi {
  factory BoChiaApi(Dio dio) = _BoChiaApi;

  @POST('/Divider/loaddata')
  Future<BaseResponse<BoChiaListResponse>> getBoChiaList(
    @Body() BoChiaListPayload body,
  );

  @POST('/divider/viewusedport')
  Future<BaseResponse<DividerViewUsedPortResponse>> getDividerUsedPortList(
    @Body() Map<String, dynamic> body,
  );
}
