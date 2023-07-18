import 'package:flutter_base/core/api_base.dart';

import 'nodejs_retrofit_api.dart';

class NodejsApi extends ApiBase implements NodejsRetrofitApi {
  NodejsApi({required this.api});

  final NodejsRetrofitApi api;

  @override
  Future getSuccessfulData() {
    return callAPI(api.getSuccessfulData);
  }

  @override
  Future getFailData() {
    return callAPI(api.getFailData);
  }
}
