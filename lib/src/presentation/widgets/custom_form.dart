import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:sotintas/src/presentation/controllers/login_controller.dart';

class CustomForm extends StatelessWidget {
  final String title;
  final List<FieldType> fields;
  final String buttonText;
  final LoginController controller;
  final Function() onSubmit;

  const CustomForm({
    Key? key,
    required this.title,
    required this.fields,
    required this.buttonText,
    required this.controller,
    required this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          Text(title),
          ...fields.map((element) {
            switch (element) {
              case FieldType.name:
                return const NameFormField();
              case FieldType.email:
                return EmailFormField(controller: controller.emailController);
              case FieldType.password:
                return PasswordFormField(
                  controller: controller.passwordController,
                );
              case FieldType.confirmPassword:
                return PasswordFormField(
                  fieldLabel: "Confirmar senha",
                  controller: controller.passwordController,
                );
              default:
                return const Text("");
            }
          }).toList(),
          ElevatedButton(
            onPressed: () => submitIfFormValid(_formKey),
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }

  void submitIfFormValid(
    GlobalKey<FormState> formKey,
  ) {
    if (formKey.currentState!.validate()) {
      onSubmit();
    }
  }
}

class EmailFormField extends StatelessWidget {
  final TextEditingController controller;
  const EmailFormField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Email"),
        TextFormField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          controller: controller,
          validator: MultiValidator([
            RequiredValidator(errorText: "Campo obrigat??rio"),
            EmailValidator(errorText: "Email inv??lido"),
          ]),
        ),
      ],
    );
  }
}

class NameFormField extends StatelessWidget {
  const NameFormField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Nome"),
        TextFormField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}

class PasswordFormField extends StatefulWidget {
  final TextEditingController controller;

  final String fieldLabel;
  const PasswordFormField({
    Key? key,
    this.fieldLabel = "Senha",
    required this.controller,
  }) : super(key: key);

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _obscureText = true;

  final String atLeast1LowercasePattern = '(?=(.*[a-z]){1,})';
  final String atLeast1UppercasePattern = '(?=(.*[A-Z]){1,})';
  final String atLeast1NumberPattern = '(?=(.*[0-9]){1,})';
  final String atLeast1SpecialCharacterPattern = '(?=(.*[!@#\$%^&*()_+]){1,})';
  final String atLeast8CharactersPattern = '.{8,}';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.fieldLabel),
        TextFormField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () => setState(() {
                _obscureText = !_obscureText;
              }),
            ),
          ),
          controller: widget.controller,
          validator: MultiValidator([
            RequiredValidator(errorText: "Campo obrigat??rio"),
            PatternValidator(
              """^
$atLeast1LowercasePattern
$atLeast1UppercasePattern
$atLeast1NumberPattern
$atLeast1SpecialCharacterPattern
$atLeast8CharactersPattern\$"""
                  .replaceAll("\n", ""),
              errorText: """
A senha deve ter o seguinte padr??o:
-> 1 letra min??scula
-> 1 letra mai??scula
-> 1 n??mero
-> 1 caractere especial
-> m??nimo de 8 caracteres""",
            ),
          ]),
          obscureText: _obscureText,
        ),
      ],
    );
  }
}

enum FieldType {
  name,
  email,
  password,
  confirmPassword,
}
