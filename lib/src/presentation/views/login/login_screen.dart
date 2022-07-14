import 'package:flutter/material.dart';
import 'package:sotintas/src/presentation/controllers/login_controller.dart';
import 'package:sotintas/src/presentation/views/create_account_screen.dart';
import 'package:sotintas/src/presentation/views/home_screen.dart';
import 'package:sotintas/src/presentation/widgets/custom_form.dart';
import 'package:sotintas/src/presentation/widgets/sotintas_logo.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "login_screen";
  final LoginController controller;

  const LoginScreen({Key? key, required this.controller}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

/// This class is the state of the [LoginScreen] widget.
class _LoginScreenState extends State<LoginScreen> {
  @override
  void dispose() {
    widget.controller.emailController.dispose();
    widget.controller.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SoTintasLogo(),
            LoginForm(controller: widget.controller),
            const CreateAccountButton(),
          ],
        ),
      ),
    );
  }
}

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
    final isAuth = await controller.auth(
      controller.emailController.text,
      controller.passwordController.text,
    );
    if (isAuth) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const HomeScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Erro ao realizar login"),
          duration: const Duration(seconds: 3),
          action: SnackBarAction(
            label: "Ok",
            onPressed: () =>
                ScaffoldMessenger.of(context).hideCurrentSnackBar(),
          ),
        ),
      );
    }
  }
}

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const CreateAccountScreen(),
        ),
      ),
      child: const Text("Criar conta"),
    );
  }
}
