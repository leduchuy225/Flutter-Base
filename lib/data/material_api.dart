import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/base_response.dart';
import '../models/material/get_material_list_response.dart';

part 'material_api.g.dart';

@RestApi()
abstract class MaterialApi {
  factory MaterialApi(Dio dio) = _MaterialApi;

  @POST('/apiv1/data/GetMaterial')
  Future<BaseResponse<GetMaterialListResponse>> getMaterialList();
}
