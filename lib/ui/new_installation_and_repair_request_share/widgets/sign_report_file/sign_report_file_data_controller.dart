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
    if (!bbntEmailTextController.checkValidation()) {
      return false;
    }
    if (!bbntAccountTextController.checkValidation()) {
      return false;
    }
    if (!bbntPasswordTextController.checkValidation()) {
      return false;
    }
    if (!bbntIpV4TextController.checkValidation()) {
      return false;
    }
    if (!bbntServiceQualityTextController.checkValidation()) {
      return false;
    }
    return true;
  }

  bool checkBbbgIsValid() {
    if (!bbbgNameTextController.checkValidation()) {
      return false;
    }
    if (!bbbgStatictisTextController.checkValidation()) {
      return false;
    }
    if (!bbbgAmountTextController.checkValidation()) {
      return false;
    }
    if (!bbbgStatusTextController.checkValidation()) {
      return false;
    }
    return true;
  }
}
