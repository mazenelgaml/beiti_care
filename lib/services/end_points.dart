class EndPoint {
  static String baseUrl="https://nurseproject-production-ad11.up.railway.app";
  static String getUserDataEndPoint(id) {
    return "/nectar/get/$id";
  }
}

class ApiKey {
  static String status = "status";
  static String errorMessage = "ErrorMessage";
  static String email = "email";
  static String password = "password";
  static String token = "token";
  static String message = "message";
  static String id = "id";
  static String username = "username";
  static String phone = "phone";
  static String confirmPassword = "confirmPassword";
  static String location = "location";
  static String profilePic = "profilePic";

}