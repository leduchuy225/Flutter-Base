class ApiMethod {
  final bool isShowError;
  final Function onError;

  const ApiMethod({this.isShowError = true, required this.onError});
}
