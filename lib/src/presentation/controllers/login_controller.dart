import 'package:flutter/cupertino.dart';
import 'package:sotintas/src/presentation/stores/user_store.dart';
import 'package:sotintas/src/utils/authentication.dart';

class LoginController {
  final UserStore userStore;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginController(this.userStore);

  Future<bool> auth(String email, String password) async {
    if (await userStore.getUser(email, password)) {
      Authentication.saveToken(userStore.user!.token!);
      return true;
    } else {
      return false;
    }
  }
}
