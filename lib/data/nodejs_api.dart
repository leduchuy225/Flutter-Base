import 'package:api_annotation/api_annotation.dart' show ApiAnnotation;
import 'package:flutter_base/core/api.dart';
import 'package:flutter_base/core/api_base.dart';

import 'nodejs_retrofit_api.dart';

part 'nodejs_api.g.dart';

@ApiAnnotation()
class _NodejsApi extends ApiBase {
  _NodejsApi({required this.api});

  final NodejsRetrofitApi api;

  @Api()
  Future getSuccessfulData() {
    return api.getSuccessfulData();
  }

  @Api()
  Future getFailData() {
    return api.getFailData();
  }
}

// class NodejsApi extends _NodejsApi {
//   NodejsApi({required super.api});
// }
