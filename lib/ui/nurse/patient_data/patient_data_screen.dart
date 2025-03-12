import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import '../../../services/translation_key.dart';

class PatientDataScreen extends StatefulWidget {
  @override
  _PatientDataScreenState createState() => _PatientDataScreenState();
}

class _PatientDataScreenState extends State<PatientDataScreen> {
  TextEditingController dateController = TextEditingController();
  TextEditingController barcodeController = TextEditingController();
  List<XFile> selectedFiles = [];

  Future<void> _selectDate(BuildContext context) async {
    debugPrint("📅 ${Datefieldclicked.tr}");
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      setState(() {
        dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  Future<void> _pickMedia() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile>? files = await picker.pickMultipleMedia();

    if (files != null && files.isNotEmpty) {
      setState(() {
        selectedFiles.addAll(files);
      });
    }
  }

  Future<void> _scanBarcode() async {
    debugPrint("📸 ${Scanbarcodeclicked.tr}");
    // هنا يمكن استدعاء كود ماسح الباركود الحقيقي
    barcodeController.text = "123456789"; // قيمة تجريبية
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 150.w, // توسيع المساحة الخاصة بـ leading
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w), // دفع المحتوى ناحية اليمين
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 24.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                    color: Color(0xffB93439),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center, // لضبط الأيقونة في المنتصف
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
              SizedBox(width: 5.w), // توسيع المسافة بين الأيقونة والنص
              Text(
                Patientdata.tr,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffB93439),
                ),
              ),
            ],
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
      ),

      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle(Code.tr),
              _buildTextField(Code.tr),

              _buildSectionTitle(Recordashortvideoorphotoswhiledraggingoptional.tr),
              _buildUploadField(),

              _buildSectionTitle(Pictureofthetubeafterplacingthebarcode.tr),
              _buildTextField(
                Scanbarcode.tr,
                icon: Icons.qr_code_scanner,
                controller: barcodeController,
                onTap: _scanBarcode,
                readOnly: true,
              ),

              SizedBox(height: 16.h),
              Text(Recordwithdrawaldata.tr,
                  style: TextStyle(color: Color(0xffB93439), fontWeight: FontWeight.bold)),
              SizedBox(height: 8.h),
              _buildSectionTitle(Nursesname.tr),
              _buildTextField(Nursesname.tr),
              _buildSectionTitle(Location.tr),
              _buildTextField(Location.tr),
              _buildSectionTitle(Date.tr),
              _buildTextField(
                Date.tr,
                icon: Icons.calendar_today,
                controller: dateController,
                onTap: () => _selectDate(context),
                readOnly: true,
              ),

              SizedBox(height: 24.h),
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffB93439),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {},
                  child: Text(Send.tr, style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 12.h, bottom: 6.h),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
      ),
    );
  }

  Widget _buildTextField(
      String hintText, {
        IconData? icon,
        TextEditingController? controller,
        VoidCallback? onTap,
        bool readOnly = false,
      }) {
    return GestureDetector(
      onTap: onTap,
      child: AbsorbPointer( // يمنع المستخدم من إدخال البيانات يدوياً
        child: TextFormField(
          controller: controller,
          readOnly: readOnly,
          enabled: !readOnly, // تأكيد أن الحقل مش معطل بالكامل
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: icon != null ? Icon(icon, color: Colors.grey) : null,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
          style: TextStyle(color: Colors.black54),
        ),
      ),
    );
  }


  Widget _buildUploadField() {
    return GestureDetector(
      onTap: _pickMedia,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedFiles.isEmpty
                  ? "${Recordashortvideoorphotoswhiledraggingoptional.tr}\n ${draggingoptional.tr}"
                  : "${selectedFiles.length} ${filesselected.tr}",
              style: TextStyle(color: Colors.black54),
            ),
            Icon(Icons.camera_alt, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
