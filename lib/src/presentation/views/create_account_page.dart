import 'package:flutter/material.dart';
import 'package:sotintas/src/presentation/widgets/custom_form.dart';
import 'package:sotintas/src/presentation/widgets/sotintas_logo.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

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
      onSubmit: () {
        print("Criar conta");
      },
    );
  }
}
