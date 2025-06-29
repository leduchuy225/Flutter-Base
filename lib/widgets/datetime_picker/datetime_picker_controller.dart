import 'package:flutter/material.dart';

import '../../core/utils/datetime_utils.dart';
import '../text_field/text_field_controller.dart';

class DatetimePickerController extends MyTextFieldController {
  DateTime? _dateTime;
  TimeOfDay? _timeOfDay;
  DateTimeRange<DateTime>? _dateTimeRange;

  final DateTime? lastDate;
  final DateTime? firstDate;
  final MyDateFormatEnum dateFormat;

  DatetimePickerController({
    this.lastDate,
    this.firstDate,
    this.dateFormat = MyDateFormatEnum.DATE,
  });

  set dateTime(DateTime? data) {
    _dateTime = data;
    text = DatetimeUtils.convertFrom(data, toFormat: dateFormat) ?? '';
  }

  DateTime? get dateTime {
    return _dateTime;
  }

  set dateTimeRange(DateTimeRange<DateTime>? data) {
    _dateTimeRange = data;
    if (data == null) {
      text = '';
    }
    text =
        '${DatetimeUtils.convertFrom(data?.start, toFormat: dateFormat) ?? ''} - ${DatetimeUtils.convertFrom(data?.end, toFormat: dateFormat) ?? ''}';
  }

  DateTimeRange<DateTime>? get dateTimeRange {
    return _dateTimeRange;
  }

  set timeOfDay(TimeOfDay? data) {
    _timeOfDay = data;
    text = data != null
        ? '${data.hour.toString().padLeft(2, '0')}:${data.minute.toString().padLeft(2, '0')}'
        : '';
  }

  TimeOfDay? get timeOfDay {
    return _timeOfDay;
  }

  DateTime get firstDateValue {
    return firstDate ?? DateTime(DateTime.now().year - 2);
  }

  DateTime get lastDateValue {
    return lastDate ?? DateTime(DateTime.now().year + 2);
  }
}
