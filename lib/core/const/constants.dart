class MyStrings {
  MyStrings._();

  static String systemError = 'Hệ thống đang gặp lỗi';
  static String connectionOff =
      'Mất kết nối internet. Vui lòng kiểm tra lại mạng';
  static String noData = 'Không có dữ liệu hiển thị';

  static String baseURL = ''; // 'https://jsonplaceholder.typicode.com';
}

class MyStatus {
  MyStatus._();

  static int error = 0;
  static int success = 1;
  static int tokenTimeOut = 3;
  static int notAuthenticate2Fa = 8;
}
