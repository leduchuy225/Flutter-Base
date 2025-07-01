class MyStrings {
  MyStrings._();

  static const String systemError = 'Hệ thống đang gặp lỗi';
  static const String connectionOff =
      'Mất kết nối internet. Vui lòng kiểm tra lại mạng';
  static const String noData = 'Không có dữ liệu hiển thị';

  static const String noInput = 'Thông tin không được để trống';

  static const String baseURL = ''; // 'https://jsonplaceholder.typicode.com';
}

class MyStatus {
  MyStatus._();

  static const int error = 0;
  static const int success = 1;
  static const int tokenTimeOut = 3;
  static const int notAuthenticate2Fa = 8;
}
