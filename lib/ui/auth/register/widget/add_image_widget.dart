import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';

import '../../../../services/translation_key.dart';
import '../controller/sign_up_controller.dart'; // Import GetX for translations


class ImagePickerWidget extends StatelessWidget {
  const ImagePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupController signupController = Get.find<SignupController>(); // استدعاء الكونترولر

    Future<void> _pickImage(ImageSource source) async {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile != null) {
        signupController.setImage(pickedFile); // تحديث الصورة في الكونترولر
      }
    }

    return GetBuilder<SignupController>(
      builder: (controller) => Container(
        height: 50.h,
        width: 338.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey, width: 1.5),
        ),
        child: Row(
          children: [
            SizedBox(width: 10),
            controller.selectedImage != null
                ? Image.file(File(controller.selectedImage!.path), width: 40, height: 40, fit: BoxFit.cover)
                : Text("اختر صورة", style: TextStyle(color: Colors.grey, fontSize: 14)),
            GestureDetector(
              onTap: () => _pickImage(ImageSource.gallery),
              child: Text("تصفح الصور", style: TextStyle(color: Color(0xff49768C), fontWeight: FontWeight.bold)),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.camera_alt_outlined, color: Colors.grey, size: 30),
              onPressed: () => _pickImage(ImageSource.camera),
            ),
          ],
        ),
      ),
    );
  }
}

