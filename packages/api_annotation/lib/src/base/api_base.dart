import '../models/api.dart';

class ApiBase<T> {
  Future callAPI(Future<T> Function() api, {ApiMethod? apiParams}) {
    return api().catchError(apiParams!.onError);
  }
}
