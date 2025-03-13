import 'dart:io';
import 'dart:ui' as img;
import 'package:beiti_care/models/sign_up_model.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:dio/dio.dart' as dio;
import 'package:http_parser/http_parser.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import '../../../../models/error_auth_model.dart';
import '../../../../models/services_model.dart';
import '../../../../services/end_points.dart';
import '../../../../services/memory.dart';
import '../../../nurse/home/nurse_home_screen.dart';
import '../../finger_print/finger_print_screen.dart';

class SignupController extends GetxController {
  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController yearsController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  final TextEditingController specialtyController = TextEditingController();
  final TextEditingController idCardController = TextEditingController();

  XFile? selectedImage;

  List<Service>? services;
  List<String>?chooseService;
  String? choosenService;
  Future<void> onInit() async {
    super.onInit();
    await CacheHelper.init();
 getServices();
  }
  /// **التحقق من صحة الاسم**
  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "الاسم مطلوب";
    } else if (value.length < 3) {
      return "يجب أن يكون الاسم أطول من حرفين";
    }
    return null;
  }

  /// **التحقق من صحة البريد الإلكتروني**
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "البريد الإلكتروني مطلوب";
    }
    final emailRegex =
    RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+\$');
    if (!emailRegex.hasMatch(value)) {
      return "البريد الإلكتروني غير صالح";
    }
    return null;
  }

  /// **التحقق من صحة كلمة المرور**
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "كلمة المرور مطلوبة";
    }
    if (value.length < 6) {
      return "يجب أن تكون كلمة المرور أطول من 6 أحرف";
    }
    return null;
  }

  /// **التحقق من تأكيد كلمة المرور**
  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "يجب تأكيد كلمة المرور";
    }
    if (value != passwordController.text) {
      return "كلمة المرور غير متطابقة";
    }
    return null;
  }

  /// **التحقق من الحقول غير الفارغة**
  String? validateNotEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "هذا الحقل مطلوب";
    }
    return null;
  }

  /// **اختيار صورة من المعرض**
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      File originalFile = File(image.path);
      final bytes = await originalFile.readAsBytes();
      img.Image decodedImage = img.decodeImage(bytes)!;

      // تصغير الصورة لجعلها أخف
      img.Image smallerImage = img.copyResize(decodedImage, width: 800);

      // **الحصول على المسار المؤقت**
      final tempDir = await getTemporaryDirectory();
      File compressedFile = File('${tempDir.path}/compressed.jpg')
        ..writeAsBytesSync(img.encodeJpg(smallerImage, quality: 75));

      selectedImage = XFile(compressedFile.path);
      update();
    }
  }

  void setImage(XFile? image) {
    selectedImage = image;
    update(); // تحديث الـ UI
  }

  String? fullPhoneNumber; // متغير جديد لتخزين الرقم مع الكود

  void setPhoneNumber(String number) {
    fullPhoneNumber = number;
    update();
  }

  /// **إرسال النموذج**
  void submitForm(BuildContext context, String selectedSpecialty) {
    if (formKey1.currentState!.validate() || formKey2.currentState!.validate()) {
      signUp(context, selectedSpecialty);
    }
  }

  bool isLoading = false;

  /// **إرسال بيانات التسجيل إلى الخادم**
  Future<void> signUp(BuildContext context, String selectedSpecialty) async {
    isLoading = true;
    update();
    choosenService=services?.firstWhere((service) => service.name==selectedSpecialty).id;
    print(choosenService);
    print("hellllllllloooo");


    final dio.Dio dioInstance = dio.Dio(
      dio.BaseOptions(
        baseUrl: EndPoint.baseUrl,
        validateStatus: (status) => status != null && status < 500,
      ),
    );

    try {
      dio.FormData formData = dio.FormData.fromMap({
        "userName": nameController.text.trim(),
        "email": emailController.text.trim(),
        "password": passwordController.text.trim(),
        "role": "nurse",
        "phone": fullPhoneNumber ?? phoneNumberController.text.trim(),
        "experience": experienceController.text.trim(),
        "specialty[]":[
          "${choosenService}"]
        ,
        "location": locationController.text.trim(),
        "idCard": idCardController.text.trim(),
        if (selectedImage != null)
          "image": await dio.MultipartFile.fromFile(
            selectedImage!.path,
            filename: selectedImage!.name,
            contentType: MediaType("image", "jpeg"), // تحديد نوع الصورة
          ),

      });
      formData.fields.forEach((element) {
        print("${element.key}: ${element.value}");
      });

// طباعة الصورة إن وجدت
      if (selectedImage != null) {
        print("Image: ${selectedImage!.path}");
      }
      final response = await dioInstance.post(
        "/api/nurse/register",
        data: formData,
        options: dio.Options(headers: {"Content-Type": "multipart/form-data"}),
      );

      if (response.statusCode == 201) {
        final signUpModel = SignUpModel.fromJson(response.data);
        final token = signUpModel.token;
        final id = signUpModel.newNurse?.id;

        await Get.find<CacheHelper>().saveData(key: "token", value: token);
        await Get.find<CacheHelper>().saveData(key: "id", value: id);
        Get.off(() => FingerprintAuthScreen());
        // Get.off(() => FingerprintAuthScreen(email: emailController.text.trim(),));

      } else {
        final errorModel =ErrorAuthModel.fromJson(response.data);
        final error= errorModel.errors?[0].msg;
        CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          title: "خطأ",
          text: error,
        );
      }
    } catch (e) {
      print('خطأ تسجيل الدخول: $e');
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        title: "خطأ في الاتصال",
        text: "حدث خطأ أثناء الاتصال بالخادم.",
      );
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> getServices() async {
    isLoading = true;
    update();
    final dio.Dio dioInstance = dio.Dio(
      dio.BaseOptions(
        baseUrl: EndPoint.baseUrl,
        validateStatus: (status) => status != null && status < 500,
      ),
    );

    try {
      final response = await dioInstance.get(
        "/api/service/getAllServices",
        options: dio.Options(headers: {"Content-Type": "application/json"}),
      );

      if (response.statusCode == 200) {
        ServicesModel servicesModel = ServicesModel.fromJson(response.data);
        services = servicesModel.services;
        chooseService=services?.map((service) => service.name??"").toList() ?? [];

        print(services);
      } else {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(content: Text('Error fetching services data')),
        );
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: Text('Error occurred while connecting to the Server')),
      );
    } finally {
      isLoading = false;
      update();
    }
  }
}