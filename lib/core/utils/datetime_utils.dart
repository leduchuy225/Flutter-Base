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

class DatetimeUtils {
  DatetimeUtils._();

  static String convertFrom(
    DateTime date, {
    required MyDateFormatEnum toFormat,
  }) {
    return toFormat.fm.format(date);
  }

  static String? convertFromStrTo(
    String? dateStr, {
    required MyDateFormatEnum toFm,
    required MyDateFormatEnum fromFm,
  }) {
    if (dateStr == null) return null;
    try {
      return toFm.fm.format(fromFm.fm.parse(dateStr));
    } catch (e) {
      return null;
    }
  }

  static DateTime? convertToDateFrom(
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
}
