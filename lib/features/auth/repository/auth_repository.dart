import 'package:talking_app/features/auth/model/login_model.dart';

class AuthRepository {
  Future<bool> login(LoginModel model) async {
    await Future.delayed(const Duration(seconds: 2));
    if (model.email == "test@test.com" && model.password == "123456") {
      return true;
    } else {
      throw Exception("Invalid Credentials");
    }
  }
}
