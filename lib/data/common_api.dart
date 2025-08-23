import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/base_response.dart';

part 'common_api.g.dart';

@RestApi()
abstract class CommonApi {
  factory CommonApi(Dio dio) = _CommonApi;

  @POST('/apiv1/File/ConvertDocxToPdf')
  Future<BaseResponse> convertDocToPdf(@Body() Map<String, dynamic> body);
}
