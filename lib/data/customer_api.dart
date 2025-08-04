import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/base_response.dart';
import '../models/customer/customer_search_payload.dart';
import '../models/customer/customer_search_response.dart';

part 'customer_api.g.dart';

@RestApi()
abstract class CustomerApi {
  factory CustomerApi(Dio dio) = _CustomerApi;

  @POST('/customer/loaddata')
  Future<BaseResponse<CustomerSearchResponse>> searchCustomer(
    @Body() CustomerSearchPayload body,
  );
}
