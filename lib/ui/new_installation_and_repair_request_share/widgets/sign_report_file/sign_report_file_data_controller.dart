import 'package:flutter_base/widgets/text_field/text_field_controller.dart';

import '../../../../widgets/datetime_picker/datetime_picker_controller.dart';

class SignReportFileDataController {
  final completeDateController = DatetimePickerController();

  // Biên bản nghiệm thu
  final bbntEmailTextController = MyTextFieldController();
  final bbntAccountTextController = MyTextFieldController();
  final bbntPasswordTextController = MyTextFieldController();
  final bbntIpV4TextController = MyTextFieldController();
  final bbntServiceQualityTextController = MyTextFieldController();

  // Biên bản bàn giao
  final bbbgNameTextController = MyTextFieldController();
  final bbbgStatictisTextController = MyTextFieldController();
  final bbbgAmountTextController = MyTextFieldController();
  final bbbgStatusTextController = MyTextFieldController();

  bool checkBbntIsValid() {
    if (!bbntEmailTextController.checkIsNotEmpty()) {
      return false;
    }
    if (!bbntAccountTextController.checkIsNotEmpty()) {
      return false;
    }
    if (!bbntPasswordTextController.checkIsNotEmpty()) {
      return false;
    }
    if (!bbntIpV4TextController.checkIsNotEmpty()) {
      return false;
    }
    if (!bbntServiceQualityTextController.checkIsNotEmpty()) {
      return false;
    }
    return true;
  }

  bool checkBbbgIsValid() {
    if (!bbbgNameTextController.checkIsNotEmpty()) {
      return false;
    }
    if (!bbbgStatictisTextController.checkIsNotEmpty()) {
      return false;
    }
    if (!bbbgAmountTextController.checkIsNotEmpty()) {
      return false;
    }
    if (!bbbgStatusTextController.checkIsNotEmpty()) {
      return false;
    }
    return true;
  }
}
