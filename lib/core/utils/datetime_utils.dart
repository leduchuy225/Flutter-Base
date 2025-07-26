import 'package:flutter_base/core/utils/utils.dart';
import 'package:intl/intl.dart';

enum MyDateFormatEnum {
  DATE('dd/MM/yyyy'),
  DATE_TIME24s('dd/MM/yyyy HH:mm:ss');

  const MyDateFormatEnum(this.format);

  final String format;

  DateFormat get fm {
    return DateFormat(format);
  }
}

class MyDatetimeUtils {
  MyDatetimeUtils._();

  static int _extractMilliseconds(String dateString) {
    final numericString = dateString.replaceAll(RegExp(r'\D'), '');
    return int.parse(numericString);
  }

  static DateTime? convertDateFromAPI(String? data) {
    if (isNullOrEmpty(data)) {
      return null;
    }
    try {
      final millisecond = _extractMilliseconds(data!);
      return DateTime.fromMillisecondsSinceEpoch(millisecond);
    } catch (error) {
      return null;
    }
  }

  static String? formatDateFromAPI(
    String? date, {
    MyDateFormatEnum toFormat = MyDateFormatEnum.DATE,
  }) {
    if (date == null) {
      return null;
    }
    return MyDatetimeUtils.formatDate(
      MyDatetimeUtils.convertDateFromAPI(date),
      toFormat: toFormat,
    );
  }

  static String? formatDate(
    DateTime? date, {
    MyDateFormatEnum toFormat = MyDateFormatEnum.DATE,
  }) {
    if (date == null) {
      return null;
    }
    return toFormat.fm.format(date);
  }

  static String? formatDateFromEnum(
    String? dateStr, {
    required MyDateFormatEnum toFm,
    required MyDateFormatEnum fromFm,
  }) {
    if (dateStr == null) {
      return null;
    }
    try {
      return toFm.fm.format(fromFm.fm.parse(dateStr));
    } catch (e) {
      return null;
    }
  }

  static DateTime? convertToDate(
    String? dateStr, {
    required MyDateFormatEnum fromFormat,
  }) {
    if (dateStr == null) {
      return null;
    }
    try {
      return fromFormat.fm.parse(dateStr);
    } catch (e) {
      return null;
    }
  }

  static int compareDateFromAPI({
    String? firstDateString,
    String? secondDateString,
    DateTime? firstDateTime,
    DateTime? secoundDateTime,
  }) {
    final firstDate =
        firstDateTime ?? MyDatetimeUtils.convertDateFromAPI(firstDateString);
    final secondDate =
        secoundDateTime ?? MyDatetimeUtils.convertDateFromAPI(secondDateString);

    if (firstDate == null) {
      return 1;
    }
    if (secondDate == null) {
      return -1;
    }
    return firstDate.compareTo(secondDate);
  }
}
