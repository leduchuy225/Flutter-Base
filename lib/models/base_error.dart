class MyError implements Exception {
  final String? cause;
  MyError(this.cause);

  @override
  String toString() {
    return cause ?? 'An error occurred';
  }
}
