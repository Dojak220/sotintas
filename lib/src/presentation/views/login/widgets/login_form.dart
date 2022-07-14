import 'package:flutter/material.dart';
import 'package:sotintas/src/presentation/controllers/login_controller.dart';
import 'package:sotintas/src/presentation/views/home_screen.dart';
import 'package:sotintas/src/presentation/widgets/custom_form.dart';

class LoginForm extends StatelessWidget {
  final LoginController controller;
  const LoginForm({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomForm(
      title: "Entrar na plataforma",
      fields: const [FieldType.email, FieldType.password],
      buttonText: "Login",
      controller: controller,
      onSubmit: () async => auth(context),
    );
  }

  Future<void> auth(BuildContext context) async {
    final email = controller.emailController.text;
    final password = controller.passwordController.text;

    final isLoginValid = await controller.auth(email, password);

    if (isLoginValid) {
      goToHomeScreen(context);
    } else {
      showLoginAttemptErrorSnack(context);
    }
  }

  void showLoginAttemptErrorSnack(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Erro ao realizar login"),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: "Ok",
          onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
        ),
      ),
    );
  }

  void goToHomeScreen(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const HomeScreen(),
      ),
    );
  }
}
