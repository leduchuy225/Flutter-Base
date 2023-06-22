import 'package:flutter_base/data/api_base.dart';

import 'nodejs_retrofit_api.dart';

class NodejsApi extends ApiBase {
  NodejsApi({required this.api});

  final NodejsRetrofitApi api;

  Future getSuccessfulData() {
    return callAPI(api.getSuccessfulData);
  }

  Future getFailData() {
    return callAPI(api.getFailData);
  }
}
