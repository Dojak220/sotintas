import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sotintas/src/presentation/controllers/login_controller.dart';
import 'package:sotintas/src/presentation/stores/user_store.dart';
import 'package:sotintas/src/presentation/widgets/custom_form.dart';
import 'package:sotintas/src/presentation/widgets/sotintas_logo.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  static const routeName = "create_account_screen";

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SoTintasLogo(),
            NewAccountForm(),
          ],
        ),
      ),
    );
  }
}

class NewAccountForm extends StatelessWidget {
  const NewAccountForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomForm(
      title: "Entrar na plataforma",
      fields: const [
        FieldType.name,
        FieldType.email,
        FieldType.password,
        FieldType.confirmPassword,
      ],
      buttonText: "Criar conta",
      controller: LoginController(GetIt.I.get<UserStore>()),
      onSubmit: () => print("Criar conta"),
    );
  }
}
