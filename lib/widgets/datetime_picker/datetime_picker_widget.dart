import 'package:flutter/material.dart';

import '../text_field/text_field_widget.dart';
import 'datetime_picker_controller.dart';

class DatetimePicker extends StatefulWidget {
  final String title;
  final bool isTimePicker;
  final bool isDateRangePicker;
  final DatetimePickerController? controller;

  const DatetimePicker({
    super.key,
    this.controller,
    required this.title,
    this.isTimePicker = false,
    this.isDateRangePicker = false,
  });

  @override
  State<DatetimePicker> createState() => _DatetimePickerState();
}

class _DatetimePickerState extends State<DatetimePicker> {
  late final DatetimePickerController _controller;

  DatetimePickerController get _mainController =>
      widget.controller ?? _controller;

  Future<void> _onTap() async {
    if (widget.isDateRangePicker) {
      final rangeSelected = await showDateRangePicker(
        context: context,
        lastDate: _mainController.lastDateValue,
        firstDate: _mainController.firstDateValue,
        initialDateRange: _mainController.dateTimeRange,
      );
      if (rangeSelected != null) {
        _mainController.dateTimeRange = rangeSelected;
      }
    } else if (widget.isTimePicker) {
      final timeSelected = await showTimePicker(
        context: context,
        initialTime: _mainController.timeOfDay ?? TimeOfDay.now(),
      );
      if (timeSelected != null) {
        _mainController.timeOfDay = timeSelected;
      }
      return;
    } else {
      final dateSelected = await showDatePicker(
        context: context,
        initialDate: _mainController.dateTime,
        lastDate: _mainController.lastDateValue,
        firstDate: _mainController.firstDateValue,
      );
      if (dateSelected != null) {
        _mainController.dateTime = dateSelected;
      }
    }
  }

  @override
  void initState() {
    super.initState();

    if (widget.controller == null) {
      _controller = DatetimePickerController();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      maxLines: 1,
      onTap: _onTap,
      readOnly: true,
      labelText: widget.title,
      controller: _mainController,
    );
  }
}
