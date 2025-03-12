import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../services/translation_key.dart';

class ChangePasswordController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool containsNumber = false;
  bool containsLetter = false;

  /// **Validates password when user types**
  void validatePasswordOnChange(String value) {
    containsNumber = value.contains(RegExp(r'[0-9]'));
    containsLetter = value.contains(RegExp(r'[a-zA-Z]'));
    update();
  }

  /// **Validation for submission**
  String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return passwordCannotBeEmpty.tr;
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return passwordMustContainNumber.tr;
    }
    if (!value.contains(RegExp(r'[a-zA-Z]'))) {
      return passwordMustContainLetter.tr;
    }
    return null;
  }

  /// **Validation for Confirm Password**
  String? validateConfirmPassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return confirmPasswordCannotBeEmpty.tr;
    }
    if (value != passwordController.text) {
      return passwordsDoNotMatch.tr;
    }
    return null;
  }
}
