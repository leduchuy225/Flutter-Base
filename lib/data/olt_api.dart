import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/base_response.dart';
import '../models/olt/olt_getall_response.dart';
import '../models/olt/olt_list_payload.dart';
import '../models/olt/olt_list_response.dart';

part 'olt_api.g.dart';

@RestApi()
abstract class OltApi {
  factory OltApi(Dio dio) = _OltApi;

  @POST('/olt/loaddata')
  Future<BaseResponse<OltListResponse>> getOltList(@Body() OltListPayload body);

  @POST('/olt/getall')
  Future<BaseResponse<OltGetallResponse>> getOltByProvince(
    @Body() Map<String, dynamic> body,
  );
}
