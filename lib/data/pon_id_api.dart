import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/base_response.dart';
import '../models/pon_id/pon_id_list_payload.dart';
import '../models/pon_id/pon_id_list_response.dart';

part 'pon_id_api.g.dart';

@RestApi()
abstract class PonIdApi {
  factory PonIdApi(Dio dio) = _PonIdApi;

  @POST('/ponid/loaddata')
  Future<BaseResponse<PonIdListResponse>> getPonIdList(
    @Body() PonIdListPayload body,
  );
}
