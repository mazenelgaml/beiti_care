import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

import '../controller/sign_up_controller.dart';

class FilePickerWidget extends StatelessWidget {
  const FilePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupController signupController = Get.find<SignupController>(); // استدعاء الكونترولر

    Future<void> _pickFile() async {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null && result.files.single.path != null) {
        signupController.setFile(File(result.files.single.path!)); // تحديث الملف في الكونترولر
      }
    }

    return GetBuilder<SignupController>(
      builder: (controller) => Container(
        height: 50,
        width: 338,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey, width: 1.5),
        ),
        child: Row(
          children: [
            SizedBox(width: 10),
            controller.selectedFile != null
                ? Text(
              controller.selectedFile!.path.split('/').last,
              style: TextStyle(color: Colors.black, fontSize: 14),
              overflow: TextOverflow.ellipsis,
            )
                : Text("اختر ملف", style: TextStyle(color: Colors.grey, fontSize: 14)),
            Spacer(),
            GestureDetector(
              onTap: _pickFile,
              child: Row(
                children: [
                  Icon(Icons.upload_file, color: Color(0xff49768C), size: 30),
                  SizedBox(width: 5),
                  Text("رفع ملف", style: TextStyle(color: Color(0xff49768C), fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
