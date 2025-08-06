import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/base_response.dart';
import '../models/slid/slid_list_payload.dart';
import '../models/slid/slid_list_response.dart';

part 'slid_api.g.dart';

@RestApi()
abstract class SlidApi {
  factory SlidApi(Dio dio) = _SlidApi;

  @POST('/SLID/loaddata')
  Future<BaseResponse<SlidListResponse>> getSlidList(
    @Body() SlidListPayload body,
  );
}
