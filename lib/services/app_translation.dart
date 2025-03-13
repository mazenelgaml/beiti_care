import 'package:get/get_navigation/src/root/internacionalization.dart';

import 'package:beiti_care/services/translation_key.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    "en": {
      //login page
      logIn: "Log In",
      client: "Client",
      nurse: "Nurse",
      email: "Email",
      password: "Password",
      forgetPassword: "Forget Password?",
      register: "Register",
      dontHaveAccount: "Don't have an account?",


      //otp page
      OTPVerification:"OTP Verification",
      Pleaseenterthecodesendtoyourmobilenumber:"Please enter the code send to your mobile number",
      RESEND:"RESEND",
      Ididntreceiveanycode:"I didn’t receive any code.",
      Submit:"Submit",

      //Register page
      Full_Name:"Full Name",
      phone_Number:"Phone Number",
      Age:"Age",
      Years:"Years",
      Male:"Male",
      Feminine:"Feminine",
      confirm_Password:"confirm Password",
      AlreadyHaveAnAccount:"Already Have an Account?",
      image:"image",
      Experience:"Experience",
      Specialty:"Specialty",
      Location:"Location",
      ID_Card:"ID Card",
      Pleaseuploadyourmedicalqualificationcertificate:"Please upload your medical qualification certificate.",

      //add_image_widget
      imageHereOr: "image here Or",
      browseImage: "Browse Image",
      permissionRequired: "Permission Required",
      permissionMessage: "You need to grant permission from settings to use this feature.",
      cancel: "Cancel",
      openSettings: "Open Settings",

      //sign_up_controller
      nameRequired: "Name is required",
      nameMinLength: "Name must be at least 3 characters",
      emailRequired: "Email is required",
      invalidEmail: "Invalid email",
      passwordRequired: "Password is required",
      passwordMinLength: "Password must be at least 6 characters",
      confirmPasswordRequired: "Confirm password is required",
      passwordMismatch: "Passwords do not match",
      fieldCannotBeEmpty: "This field cannot be empty",
      success: "Success",
      registrationSuccess: "Registration successful",

      //forget password
      enterPhoneNumberForOTP: "Please enter your mobile to send you a verification code",
      sendOTP: "Send OTP",

      //finger print page
      enterFingerprint: "Enter Fingerprint",
      scanFingerprintToAuthenticate: "Scan your fingerprint to authenticate",
      authenticationError: "Authentication Error",

      //change password screen
      Change_Password:"Change Password",
      Pleaseenteryourpasswordtocontinue:"Please enter your password to continue",
      YourPasswordMustContain:"YourPasswordMustContain",
      Numbers:"Numbers",
      Letters:"Letters",
      Reset:"Reset",

      // change_password_controller
      passwordCannotBeEmpty : "password Cannot Be Empty",
      passwordMustContainNumber : "password Must Contain Number",
      passwordMustContainLetter :"password Must Contain Letter",
      confirmPasswordCannotBeEmpty :"confirm Password Cannot Be Empty",
      passwordsDoNotMatch :"passwords Do Not Match",

      //on boarding first page
      onBoardingFirstText:"Your comfort matters to us! 🌿 We provide high-quality home nursing care with personalize attention. Request now in easy and quick steps",
      nextBtn:"Next",
      skipBtn:"Skip",

      //on boarding second page
      onBoardingSecondText:"Medical care is now closer to you! 🏡 Request your specialized nurse anytime, anywhere",

      //on boarding third page
      onBoardingThirdText:"Your health is our priority! 🏥 With our app,get home nursing services easily and comfortably.",

      //on boarding get location page
       getMyLocation:"Get My Location",
       onBoardingGetLocationText:"We will use the location of the device near you to search for a nurse when you request the service.",
       locateBtn:"Locate",
       notNowBtn:"Not NOW",

      //nurse folder
      //change language screen
      Language:"Language",
      Arabic:"Arabic",
      English:"English",
      Save:"Save",
      Languageupdatedto:"Language updated to",

      //help screen
      Help:"Help",
      integratedhealthcareservices:"integrated healthcare services",
      ContactUs:"Contact Us",

      //nurse home page
      patient:"patient",
      Completed:"Completed",
      Pending:"Pending",
      TotalRevenue:"Total Revenue",
      Youhavenorequests:"You have no requests.",

      //patient data page
      Datefieldclicked:"Date field clicked!",
      Scanbarcodeclicked:"Scan barcode clicked!",
      Patientdata:"Patient data",
      Code:"Code",
      Recordashortvideoorphotoswhiledraggingoptional:"Record a short video or photos while dragging (optional)",
      Pictureofthetubeafterplacingthebarcode:"Picture of the tube after placing the barcode",
      Scanbarcode:"Scan barcode",
      Recordwithdrawaldata:"Record withdrawal data",
      Nursesname:"Nurse's name",
      Date:"Date",
      Send:"Send",
      draggingoptional:"dragging (optional)",
      filesselected:"files selected",
      //PolicyPrivacy screen
      PolicyPrivacy:"PolicyPrivacy",

      //request screen
      Requests:"Requests",
      Accept:"Accept",

      //Wallet page
      Wallet:"Wallet",
      Pay:"Pay",
      Withdraw:"Withdraw",

      //end of nurse folder

      //profile folder
      // about screen
      About:"About",
      Introduction:"Introduction",
      Ournursingservices:"Our nursing services",
      Weprovidecomprehensivehealthcareinyourhome:"We provide comprehensive healthcare in your home",

      //contact us page
      Message:"Message",

      //more screen
      More:"More",
      WithdrawHistory:"Withdraw History",
      Logout:"Log out",

      //notifications screen
      Notifications:"Notifications",
      Yourrequesthasbeenapproved:"Your request has been approved.",

      //profile change password screen
      Passwordchangedsuccessfully:"Password changed successfully!",
      Profile:"Profile",
      EditProfilePicture:"Edit Profile Picture",
      Pleaseenterpassword:"Please enter password",
      Passwordmustbeatleast6characters:"Password must be at least 6 characters",
      Pleaseconfirmpassword:"Please confirm password",
      Passwordsdonotmatch:"Passwords do not match",
      DeleteAccount:"Delete Account",

      //bottom nav bar
      homeBottomNav:"Home",

    },
    "ar": {

      //login page
      logIn: "تسجيل الدخول",
      client: "عميل",
      nurse: "ممرض",
      email: "البريد الإلكتروني",
      password: "كلمة المرور",
      forgetPassword: "هل نسيت كلمة المرور؟",
      register: "انشاء حساب",
      dontHaveAccount: "ليس لديك حساب؟",


      //otp page
      OTPVerification:"التحقق لمرة واحدة",
      Pleaseenterthecodesendtoyourmobilenumber:"يرجى إدخال الرمز المرسل إلى رقم هاتفك المحمول",
      RESEND:"اعادة ارسال",
      Ididntreceiveanycode:"لم يصلني اي كود.",
      Submit:"ارسال",

      //register page
      Full_Name:"الاسم الكامل",
      phone_Number:"رقم الهاتف",
      Age:"العمر",
      Years:"السنوات",
      Male:"ذكر",
      Feminine:"انثى",
      confirm_Password:"تاكيد كلمة المرور",
      AlreadyHaveAnAccount:"هل لديك حساب بالفعل؟",
      image:"صورة",
      Experience:"الخبرة",
      Specialty:"التخصص",
      Location:"الموقع",
      ID_Card:"رقم الهوية",
      Pleaseuploadyourmedicalqualificationcertificate:"يرجى تحميل شهادة المؤهل الطبي الخاصة بك.",


      //add_image_widget
      imageHereOr: "الصورة هنا أو",
      browseImage: "تصفح الصورة",
      permissionRequired: "الإذن مطلوب",
      permissionMessage: "يجب منح الإذن من الإعدادات لاستخدام هذه الميزة.",
      cancel: "إلغاء",
      openSettings: "فتح الإعدادات",

      //sign_up_controller
      nameRequired: "الاسم مطلوب",
      nameMinLength: "يجب أن يكون الاسم على الأقل 3 أحرف",
      emailRequired: "البريد الإلكتروني مطلوب",
      invalidEmail: "البريد الإلكتروني غير صالح",
      passwordRequired: "كلمة المرور مطلوبة",
      passwordMinLength: "يجب أن تكون كلمة المرور على الأقل 6 أحرف",
      confirmPasswordRequired: "تأكيد كلمة المرور مطلوب",
      passwordMismatch: "كلمات المرور غير متطابقة",
      fieldCannotBeEmpty: "هذا الحقل لا يمكن أن يكون فارغًا",
      success: "نجاح",
      registrationSuccess: "تم التسجيل بنجاح",

      //forget password
      enterPhoneNumberForOTP: "يرجى إدخال رقم الهاتف لإرسال رمز التحقق",
      sendOTP: "إرسال رمز التحقق",

      //finger print page
      enterFingerprint: "أدخل بصمة الإصبع",
      scanFingerprintToAuthenticate: "امسح بصمتك للمصادقة",
      authenticationError: "خطأ في المصادقة",

      //change password screen
      Change_Password:"تغير كلمة المرور",
      Pleaseenteryourpasswordtocontinue:"الرجاء ادخال كلمة المرور للاستمرار",
      YourPasswordMustContain:"كلمة المرور يجب ان تحتوي على ",
      Numbers:"ارقام",
      Letters:"احرف",
      Reset:"تأكيد التغير",

      // change_password_controller
      passwordCannotBeEmpty : "لا يمكن أن تكون كلمة المرور فارغة",
      passwordMustContainNumber : "يجب أن تحتوي كلمة المرور على رقم واحد على الأقل",
      passwordMustContainLetter :"يجب أن تحتوي كلمة المرور على حرف واحد على الأقل",
      confirmPasswordCannotBeEmpty :"لا يمكن أن يكون تأكيد كلمة المرور فارغًا",
      passwordsDoNotMatch :"كلمات المرور غير متطابقة",

      //on boarding first page
      onBoardingFirstText:"راحتك تهمنا! 🌿 نحن نقدم رعاية تمريضية منزلية عالية الجودة مع اهتمام شخصي. اطلب الآن بخطوات سهلة وسريعة.",
      nextBtn:"التالي",
      skipBtn:"تخطي",

      //on boarding second page
      onBoardingSecondText:"الرعاية الطبية أصبحت أقرب إليك! 🏡 اطلب ممرضك المتخصص في أي وقت ومن أي مكان.",

      //on boarding third page
      onBoardingThirdText:"صحتك هي أولويتنا! 🏥 مع تطبيقنا، احصل على خدمات التمريض المنزلي بسهولة وراحة.",

      //on boarding get location page
      getMyLocation:"الحصول على موقعي",
      onBoardingGetLocationText:"سنستخدم موقع الجهاز القريب منك للبحث عن ممرض عند طلبك للخدمة.",
      locateBtn:"تحديد الموقع",
      notNowBtn:"ليس الآن",

      //end of auth folder

      //nurse folder
      //chnage language screen
      Language:"اللغة",
      Arabic:"العربية",
      English:"الانجليزية",
      Save:"حفظ",
      Languageupdatedto:"تم تحديث اللغة الى",

      //help screen
      Help:"مساعدة",
      integratedhealthcareservices:"الخدمات الصحية المتكاملة",
      ContactUs:"تواصل معنا",

      //nurse home page
      patient:"مريض",
      Completed:"مكتمل",
      Pending:"قيد الانتظار",
      TotalRevenue:"إجمالي الإيرادات",
      Youhavenorequests:"ليس لديك أي طلبات.",

      //patient data page
      Datefieldclicked:"تم النقر على حقل التاريخ!",
      Scanbarcodeclicked:"تم النقر لمسح الباركود!",
      Patientdata:"بيانات المريض",
      Code:"الرمز",
      Recordashortvideoorphotoswhiledraggingoptional:"سجل فيديو قصير أو صور أثناء السحب (اختياري)",
      Pictureofthetubeafterplacingthebarcode:"صورة للأنبوب بعد وضع الباركود",
      Scanbarcode:"مسح الرمز",
      Recordwithdrawaldata:"تسجيل بيانات السحب",
      Nursesname:"اسم الممرض",
      Date:"التاريخ",
      Send:"ارسال",
      draggingoptional:"أثناء السحب (اختياري",
      filesselected:"الملفات المحددة",
      PolicyPrivacy:"سياسة الخصوصية",

      //request screen
      Requests:"الطلبات",
      Accept:"قبول",

      //Wallet page
      Wallet:"المحفظة",
      Pay:"دفع",
      Withdraw:"سحب",
      //end of nurse folder

      //profile folder
      //about screen
      About:"عن",
      Introduction:"مقدمة",
      Ournursingservices:"خدماتنا التمريضية",
      Weprovidecomprehensivehealthcareinyourhome:"نحن نقدم الرعاية الصحية الشاملة في منزلك",

      //contact us page
      Message:"رسالة",

      //more screen
      More:"المزيد",
      WithdrawHistory:"تاريخ السحب",
      Logout:"تسجيل الخروج",

      //notifications screen
      Notifications:"الاشعارات",
      Yourrequesthasbeenapproved:"تم قبول طلبك.",

      //profile change password screen
      Passwordchangedsuccessfully:"تم تغير كلمة المرور بنجاح!",
      Profile:"الملف الشخصي",
      EditProfilePicture:"تعديل الصورة الشخصية",
      Pleaseenterpassword:"الرجاء ادخال كلمة المرور",
      Passwordmustbeatleast6characters:"يجب أن تكون كلمة المرور مكونة من 6 أحرف على الأقل.",
      Pleaseconfirmpassword:"الرجاء تأكيد كلمة المرور",
      Passwordsdonotmatch:"كلمات المرور غير متطابقة.",
      DeleteAccount:"حذف الحساب",

      //bottom nav bar
      homeBottomNav:"الرئيسية",

    }
  };
}