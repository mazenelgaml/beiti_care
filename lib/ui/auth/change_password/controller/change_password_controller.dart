import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      return "Password cannot be empty";
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return "Password must contain at least one number";
    }
    if (!value.contains(RegExp(r'[a-zA-Z]'))) {
      return "Password must contain at least one letter";
    }
    return null;
  }

  /// **Validation for Confirm Password**
  String? validateConfirmPassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Confirm Password cannot be empty";
    }
    if (value != passwordController.text) {
      return "Passwords do not match";
    }
    return null;
  }
}
