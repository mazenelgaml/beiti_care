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
      surgery:"Surgery",
      drug:"Drug",

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
      servicesBottomNav:"Services",

      //add credit card
      cashPhoneNumber:"Cash Phone Number",
      enterTheAmount:"Enter the amount",

      //withdraw history

      amount:"Amount",
      processIsCompleted:"Process is completed",
      currency:"EGP",

      //profile_Ahmadwork folder
      // Confirmpassword page
      Profile:"Profile",
      EditProfilePicture:"Edit Profile Picture",
      Password:"Password",
      ConfirmPassword:"Confirm Password",
      Save:"Save",
      Cancel:"Cancel",
      //functionaltests page
      Functionaltests:"Functional tests",
      ECG:"ECG",
      ECG1:"ECG",
      LoremIpsum:"Lorem Ipsum is simply dummy text\nof the printing and typesetting\nindustry.",
      Date:"Date",
      Lungfunctions:"Lungfunctions",

      //Imagingtests page
      Imagingtests1:"Imaging tests",
      Magneticresonance:"Magnetic resonance",
      imaging:"imaging",

      //Laboratorytests page
      Laboratorytests1:"Laboratory tests",
      Bloodtestresult:"Blood test result",
      //Magneticresonanceimaging page
      Magneticresonanceimaging1:"Magnetic resonance imaging",
      LoremIpsumissimplydummy:"""Lorem Ipsum is simply dummy text of the printing and typesetting industry. \n Lorem Ipsum has been the industry's \n standard dummy text ever since the \n 1500s, when an unknown printer took a \n galley of type and scrambled it to make 
a type specimen book. It has survived not \n only five centuries """ ,
      butalsotheleap:'''but also the leap into electronic \n typesetting, remaining essentially \n unchanged. It was popularised in the \n 1960s with the release of Letraset sheets \n containing Lorem Ipsum passages, and \n more recently with desktop publishing \n software like Aldus PageMaker including \n versions of Lorem Ipsum.  ''',
      Requestaconsultation:"Request a consultation",
      Doyouwanttorequestaconsultation:"Do you want to request a \nconsultation?",
      Doctor:"Doctor",
      Nurse:"Nurse",
      WhatsApp:"WhatsApp",


      //medicaltests page
      Medicaltests:"Medical tests",
      Viewallprevioustestsandanalyses:"View all previous tests and analyses",
      Comparethelastresultsforanygiventest:"Compare the last 3-5 results for any given test.",

      //profile1 page
      Completeyourprofile:"Complete your profile",
      Completeyourfile:"Complete your file",
      FullName:"Full Name",
      Email:"Email",
      PhoneNumber:"Phone Number",
      DeleteAccount:"Delete Account",
      Areyousureyouwanttodeletetheaccount:"Are you sure you want to\ndelete the account?",
      No:"No",
      Yes:"Yes",
      Home:"Home",
      Services:"Services",
      Requests:"Requests",
      More:"More",
      More1:"More",

      //profile2 page
      EditProfile:"Edit Profile",
      History1:"History",
      Therapeuticexaminations:"Therapeutic examinations",
      //Therapeutic examinations page
      Therapeuticexaminations1:"Therapeutic examinations",
      Genetictesting:"Genetictesting",

      //TestResults folder
      //Testresults page
      Testresults:"Test results",
      Keepencryptedcopies:"Keep encrypted copies",

      //Notifications folder
      Yourrequesthasbeenapproved: "Your request has been approved.",
      Yourrequesthasbeenrejected: "Your request has been rejected.",
      Thenurseisonhiswaytoyou: "The nurse is on his way to you.",
      Thenursehasarrived: "The nurse has arrived.",
      Servicestartednow: "Service started now.",
      Bloodtestappointmenttoday: "Blood test appointment today.",
      Diabetescheckupappointmenttoday: "Diabetes check-up appointment today.",
      Kidneyfunctiontestappointmenttoday: "Kidney function test appointment today.",
      Resultshavebeensent: "Results have been sent.",
      Notifications1:"Notifications",
      Nonotifications:"No notifications",

      //AboutandMore folder
      About1:"About",
      Ournursingservices:"Our nursing services",
      Weprovidecomprehensivehealthcareinyourhome:"We provide comprehensive healthcare in your home",
      ContactUs:"Contact Us",
      Help:"Help",
      Language:"Language",
      PolicyPrivacy:"PolicyPrivacy",
      Logout:"Log out",

      //Basicpatiantinformation folder
      Basicpatientinformation:"Basic patient information",
      Age:"Age",
      Years:"Years",
      IDCard:"ID Card",
      Healthnumber:"Health number",
      Male:"Male",
      Feminine:"Feminine",
      Bloodtype:"Blood type",
      Generalhealthstatus:"General health status",
      Chronicdiseases:"Chronic diseases",
      Allergytomedicationsorfoods:"Allergy to medicationsor foods",
      Medicationscurrently:"Medications currently",
      Lastdateforexamination:"Last date for examination",
      Stateofemergency:"State of emergency",
      nearestcontactperson:"nearest contact person",
      Dateoflasthospitaladmission:"Date of last hospital admission",
      Havinganyprevioussurgeries:"Having any previous surgeries",
      Previouslaboratorytestsandtheirdates:"Previous laboratory tests and their \ndates",
      MedicalDiagnosesandTreatmentHistory:"Medical Diagnoses and Treatment \nHistory",
      Vaccinationsreceivedanddates:"Vaccinations received and dates",
      Previousmedicationsandtreatments:"Previous medications and treatments:",
      Listofmedicationsusedinthelastmonths:"List of medications used in the last \n6-12 months",
      Dosageandregularityoftakingit:"Dosage and regularity of taking it",
      Familyhealthhistory:"Family health history:",
      Thepresenceofhereditarydiseasesinthefamilydiabeteshighbloodpressureheartdisease:"The presence of hereditary diseases\nin the family (diabetes, high blood\npressure, heart disease,",
      Uploadmedicalfilesandxrays:"Upload medical files and x-rays",
      AbilitytouploadXraysMRIsandcardiacscans:"Ability to upload X-rays, MRIs, and cardiac scans",
      Comments:"Comments",
      Healthrecordandmedicalhistory:"Health record and medical history",
      Medicalreportsrumorsandtests:"Medical reports, rumors and tests",


      //check_out folder
      CheckOut:"Check Out",
      BackTOHome:"Back TO Home",

      //consultation folder
      Consultations:"Consultations",

      //genatic testing folder
      NotGenetictesting:"No`t Genetic testing",

      //home user folder
      Seeall:"See all",

    //medical_testt_screen
     BloodUreaUreaorBUN:"Blood Urea (Urea or BUN )",
     Incaseofcash :"In case of cash ",
     Bookingthroughtheapplicationis:"Booking through the application is ",
      Search:"Search",

  //nutrition folder
   Nutrition:"Nutrition",


 //nutrition details folder
   Ahighlyexperiencednursewhoknowswhatheisdoinganddoesitperfectly:"A highly experienced nurse who knows what he is doing and does it perfectly.",
   NutritionandDietaryAssessment:"Nutrition and Dietary Assessment",
   Customerreviews:"Customer reviews",

  //requests
   Norequests:"No requests",

  //search folder
   Catheterization:"Catheterization",
   Physiotherapy:"Physiotherapy",
   HomeNursing:"HomeNursing",
   Servicetype:"Service type",
   Selecttheservice:"Select the service",
   Searchrangekm:"Search range km",

      //suggestions folder
      Suggestions:"Suggestions",


  //user_check_out folder
   PaymentComplete:"Payment Complete",
   ThankYouForYourOrder:"Thank You For\nYour Order",
   PaymentUnComplete:"Payment UnComplete",
   Pleaseconfirmthedata:"Please confirm\nthe data",
   Chooseapaymentmethod:"Choose a payment method",
   sampling:"sampling",
   Paymentuponsampling:"Payment upon sampling",
   visa:"visa",
   PaymentbyVisa:"Payment by Visa",
   CardNumber:"Card Number",
   NameOnCard:"Name On Card",
   CVV:"CVV",
   Expiry:"Expiry",
   SaveYourCreditInformation:"Save Your Credit Information",

  //custom_nurse_card
   Specializednutritionservicesandcomprehensivenutritionalassessment:"Specialized nutrition services and comprehensive nutritional assessment",
   Minutes:"Minutes",
   Numberofcasesserved22:"Number of cases served 22",
   BookNow:"Book Now",

//custom_nutrition_and_dietary_assessment_card
   Nutritionservices:"Nutrition services",
   Findanurse:"Find a nurse",
   ShowMore:"Show More",

      //custom_review_card


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
      servicesBottomNav:"الخدمات",

      //add credit card
      cashPhoneNumber:"رقم الهاتف للدفع النقدي",
      enterTheAmount:"دخل المبلغ",

      //withdraw history

      amount:"المبلغ",
      processIsCompleted:"العملية اكتملت بنجاح. ",
      currency:"جنية",

      //profile_Ahmadwork folder
      // Confirmpassword page
      Profile:"الملف الشخصي",
      EditProfilePicture:"تعديل الملف الشخصي",
      Password:"كلمة المرور",
      ConfirmPassword:"تأكيد كلمة المرور",
      Save:"حفظ",
      Cancel:"الغاء",
      //functionaltests page
      Functionaltests:"الفحوصات الوظيفية",
      ECG:"تخطيط القلب",
      ECG1:"تخطيط القلب",
      LoremIpsum:"نص شكلي بالعربي",
      Date:"التاريخ",
      Lungfunctions:"وظائف الرئة",

      //Imagingtests page
      Imagingtests1:"اختبارات التصوير",
      Magneticresonance:"الرنين المغناطيسي",
      imaging:"تصوير",

      //Laboratorytests page
      Laboratorytests1:"الفحوصات المخبرية",
      Bloodtestresult:"نتيجة فحص الدم",
      //Magneticresonanceimaging page
      Magneticresonanceimaging1:"تصوير الرنين المغناطيسي",
      LoremIpsumissimplydummy :"لوريم إيبسوم هو نص شكلي يستخدم في صناعة\nالطباعة والنشر. كان لوريم إيبسوم هو النص\nالنموذجي القياسي في هذه الصناعة منذ القرن السادس عشر، عندما أخذ أحد الطابعين\nالمجهولين مجموعة من الأحرف وقام بترتيبها\nعشوائيًا لإنشاء كتاب عينات للطباعة.\nوقد صمد عبر خمسة قرون وليس ذلك فقط.",

  butalsotheleap:"ولكن أيضا القفزة إلى التنضيد الإلكتروني،\nمع بقاءه كما هو دون تغيير. أصبح شائعًا\nفي الستينيات مع إصدار أوراق Letraset\nالتي تحتوي على مقاطع Lorem Ipsum،\nومؤخرا مع برامج النشر المكتبي مثل Aldus PageMaker\nالتي تضمنت نسخاً من Lorem Ipsum.",
      Requestaconsultation:"طلب استشارة",
      Doyouwanttorequestaconsultation:"هل تريد طلب استشارة؟",
      Doctor:"طبيب",
      Nurse:"ممرض",
      WhatsApp:"واتس اب",

      //medicaltests page
      Medicaltests:"الفحوصات الطبية",
      Viewallprevioustestsandanalyses:"عرض الفحوصات السابقة والتحاليل",
      Comparethelastresultsforanygiventest:"مقارنة آخر 3-5 نتائج لأي اختبار معين.",

      //profile1 page
      Completeyourprofile: "أكمل ملفك الشخصي",
      Completeyourfile: "أكمل ملفك",
      FullName: "الاسم الكامل",
      Email: "البريد الإلكتروني",
      PhoneNumber: "رقم الهاتف",
      DeleteAccount: "حذف الحساب",
      Areyousureyouwanttodeletetheaccount: "هل أنت متأكد أنك تريد\nحذف الحساب؟",
      No: "لا",
      Yes: "نعم",
      Home: "الرئيسية",
      Services: "الخدمات",
      Requests: "الطلبات",
      More: "المزيد",
      More1: "المزيد",

      //profile2 page
      EditProfile: "تعديل الملف الشخصي",
      History1: "التاريخ",
      Therapeuticexaminations: "الفحوصات العلاجية",

      //Therapeutic examinations page
      Therapeuticexaminations1: "الفحوصات العلاجية",
      Genetictesting: "الاختبارات الوراثية",

      //TestResults folder
      //Testresults page
      Testresults: "نتائج الفحوصات",
      Keepencryptedcopies: "الاحتفاظ بنسخ مشفرة",

      //Notifications folder
      Yourrequesthasbeenapproved: "تمت الموافقة على طلبك.",
      Yourrequesthasbeenrejected: "تم رفض طلبك.",
      Thenurseisonhiswaytoyou: "الممرضة في طريقها إليك.",
      Thenursehasarrived: "وصلت الممرضة.",
      Servicestartednow: "تم بدء الخدمة الآن.",
      Bloodtestappointmenttoday: "موعد اختبار الدم اليوم.",
      Diabetescheckupappointmenttoday: "موعد فحص السكر اليوم.",
      Kidneyfunctiontestappointmenttoday: "موعد اختبار وظائف الكلى اليوم.",
      Resultshavebeensent: "تم إرسال النتائج.",
      Notifications1:"الاشعارات",
      Nonotifications:"لا يوجد اشعارات",

      //AboutandMore folder
      About1: "عن",
      Ournursingservices: "خدمات التمريض لدينا",
      Weprovidecomprehensivehealthcareinyourhome: "نحن نقدم رعاية صحية شاملة في منزلك",
      ContactUs: "اتصل بنا",
      Help: "مساعدة",
      Language: "اللغة",
      PolicyPrivacy: "سياسة الخصوصية",
      Logout: "تسجيل الخروج",
      //Basicpatiantinformation folder
      Basicpatientinformation: "معلومات المريض الأساسية",
      Age: "العمر",
      Years: "سنوات",
      IDCard: "بطاقة الهوية",
      Healthnumber: "رقم الصحة",
      Male: "ذكر",
      Feminine: "أنثى",
      Bloodtype: "فصيلة الدم",
      Generalhealthstatus: "الحالة الصحية العامة",
      Chronicdiseases: "الأمراض المزمنة",
      Allergytomedicationsorfoods: "الحساسية من الأدوية أو الأطعمة",
      Medicationscurrently: "الأدوية الحالية",
      Lastdateforexamination: "تاريخ آخر فحص",
      Stateofemergency: "حالة الطوارئ",
      nearestcontactperson: "أقرب شخص للتواصل",
      Dateoflasthospitaladmission: "تاريخ آخر دخول للمستشفى",
      Havinganyprevioussurgeries: "هل لديك أي عمليات جراحية سابقة",
      Previouslaboratorytestsandtheirdates: "الفحوصات المخبرية السابقة وتواريخها",
      MedicalDiagnosesandTreatmentHistory: "التشخيصات الطبية وسجل العلاج",
      Vaccinationsreceivedanddates: "اللقاحات التي تم تلقيها وتواريخها",
      Previousmedicationsandtreatments: "الأدوية والعلاجات السابقة:",
      Listofmedicationsusedinthelastmonths: "قائمة الأدوية المستخدمة في آخر 6-12 شهراً",
      Dosageandregularityoftakingit: "الجرعة وانتظام تناولها",
      Familyhealthhistory: "التاريخ الصحي العائلي:",
      Thepresenceofhereditarydiseasesinthefamilydiabeteshighbloodpressureheartdisease: """وجود أمراض وراثية في العائلة 
          (السكري، ضغط الدم المرتفع، أمراض القلب)""",
      Uploadmedicalfilesandxrays: "تحميل الملفات الطبية والأشعة السينية",
      AbilitytouploadXraysMRIsandcardiacscans: "إمكانية تحميل الأشعة السينية، والرنين المغناطيسي، والمسح القلبي",
      Comments: "التعليقات",
      Healthrecordandmedicalhistory: "السجل الصحي والتاريخ الطبي",
      Medicalreportsrumorsandtests: "التقارير الطبية والشائعات والفحوصات",

      //check_out folder
      CheckOut: "الدفع",
      BackTOHome: "العودة إلى الصفحة الرئيسية",

      //consultation folder
      Consultations:"الاستشارات",

      //genatic testing folder
      NotGenetictesting: "اختبار جيني غير متاح",

      //home_user
      Seeall:"عرض الكل",
      surgery:"جراحة",
      drug:"دواء",

      //medical_testt_screen
      BloodUreaUreaorBUN: "اليوريا في الدم (اليوريا أو BUN)",
      Incaseofcash: "في حالة الدفع نقدًا",
      Bookingthroughtheapplicationis: "الحجز من خلال التطبيق هو",
      Search: "بحث",

      //nutrition folder
      Nutrition: "التغذية",

      //nutrition details folder
      Ahighlyexperiencednursewhoknowswhatheisdoinganddoesitperfectly: "ممرضة ذات خبرة عالية تعرف ما تفعله وتقوم به بشكل مثالي.",
      NutritionandDietaryAssessment: "تقييم التغذية والنظام الغذائي",
      Customerreviews: "مراجعات العملاء",

      //requests
      Norequests:"لا يوجد طلبات",

      //search folder
      Catheterization: "قسطرة",
      Physiotherapy: "العلاج الطبيعي",
      HomeNursing: "تمريض منزلي",
      Servicetype: "نوع الخدمة",
      Selecttheservice: "حدد الخدمة",
      Searchrangekm: "نطاق البحث بالكيلومتر",

      //suggestions folder
      Suggestions:"الاقتراحات",

      //user_check_out folder
      PaymentComplete: "تم الدفع",
      ThankYouForYourOrder: "شكرًا لطلبك\n",
      PaymentUnComplete: "الدفع غير مكتمل",
      Pleaseconfirmthedata: "يرجى تأكيد البيانات\n",
      Chooseapaymentmethod: "اختر طريقة الدفع",
      sampling: "أخذ العينة",
      Paymentuponsampling: "الدفع عند أخذ العينة",
      visa: "فيزا",
      PaymentbyVisa: "الدفع بواسطة فيزا",
      CardNumber: "رقم البطاقة",
      NameOnCard: "الاسم على البطاقة",
      CVV: "رمز الأمان (CVV)",
      Expiry: "تاريخ الانتهاء",
      SaveYourCreditInformation: "حفظ معلومات البطاقة الائتمانية",

      //custom_nurse_card
      Specializednutritionservicesandcomprehensivenutritionalassessment: "خدمات التغذية المتخصصة والتقييم الغذائي الشامل",
      Minutes: "الدقائق",
      Numberofcasesserved22: "عدد الحالات التي تم تقديم الخدمة لها: 22",
      BookNow: "احجز الآن",

      //custom_nutrition_and_dietary_assessment_card
      Nutritionservices: "خدمات التغذية",
      Findanurse: "ابحث عن ممرضة",
      ShowMore: "عرض المزيد",

    }
  };
}