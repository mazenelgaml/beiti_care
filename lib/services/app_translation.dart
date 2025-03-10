import 'package:beiti_care/services/translation_key.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';




class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en": {
        logIn:"Log In"
        },
        "ar": {

          logIn:"تسجيل الدخول"
        }
      };
}
