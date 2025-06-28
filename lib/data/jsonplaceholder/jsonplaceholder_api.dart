import '../../core/extensions/future_extension.dart';
import 'jsonplaceholder_retrofit_api.dart';

class JsonPlaceholderApi {
  JsonPlaceholderApi({required this.api});

  final JsonPlaceholderRetrofitApi api;

  Future getPostList({ApiParameters? apiParameters}) {
    return api.getPostList().call(apiParameters: apiParameters);
  }
}
