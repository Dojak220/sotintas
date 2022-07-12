import 'package:flutter/material.dart';
import 'package:sotintas/src/presentation/views/create_account_page.dart';
import 'package:sotintas/src/presentation/views/home_screen.dart';
import 'package:sotintas/src/presentation/views/store_screen.dart';
import 'package:sotintas/src/presentation/widgets/custom_form.dart';
import 'package:sotintas/src/presentation/widgets/sotintas_logo.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

/// This class is the state of the [LoginPage] widget.
class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SoTintasLogo(),
            LoginForm(),
            CreateAccountButton(),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomForm(
      title: "Entrar na plataforma",
      fields: const [FieldType.email, FieldType.password],
      buttonText: "Login",
      onSubmit: () => Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const HomeScreen(),
        ),
      ),
    );
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
