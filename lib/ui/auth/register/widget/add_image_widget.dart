import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerWidget extends StatefulWidget {
  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _image;

  // اختيار صورة من المعرض
  Future<void> _pickImageFromGallery() async {
    var status = await Permission.photos.status;

    if (status.isDenied) {
      // إذا كان الإذن مرفوضًا، نطلبه مرة أخرى
      status = await Permission.photos.request();
    }

    if (status.isGranted) {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    } else if (status.isPermanentlyDenied) {
      _showPermissionDialog();
    }
  }

  // التقاط صورة بالكاميرا
  Future<void> _pickImageFromCamera() async {
    var status = await Permission.camera.status;

    if (status.isDenied) {
      status = await Permission.camera.request();
    }

    if (status.isGranted) {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    } else if (status.isPermanentlyDenied) {
      _showPermissionDialog();
    }
  }

  // عرض تنبيه إذا كان الإذن مرفوضًا نهائيًا
  void _showPermissionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("الإذن مطلوب"),
        content: Text("يجب منح الإذن من الإعدادات لاستخدام هذه الميزة."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("إلغاء"),
          ),
          TextButton(
            onPressed: () {
              openAppSettings();
              Navigator.pop(context);
            },
            child: Text("فتح الإعدادات"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
          _image != null
              ? Image.file(_image!, width: 40, height: 40, fit: BoxFit.cover)
              : Text("image here Or ", style: TextStyle(color: Colors.grey, fontSize: 14)),
          GestureDetector(
            onTap: _pickImageFromGallery, // طلب إذن المعرض فقط عند الضغط
            child: Text(
              "Browse Image",
              style: TextStyle(color: Color(0xff49768C), fontWeight: FontWeight.bold),
            ),
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.camera_alt_outlined, color: Colors.grey, size: 30),
            onPressed: _pickImageFromCamera, // طلب إذن الكاميرا فقط عند الضغط
          ),
        ],
      ),
    );
  }
}
