import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  final String title;
  final List<FieldType> fields;
  final String buttonText;
  final void Function()? onSubmit;

  const CustomForm({
    Key? key,
    required this.title,
    required this.fields,
    required this.buttonText,
    required this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Text(title),
          ...fields.map((element) {
            switch (element) {
              case FieldType.name:
                return const NameFormField();
              case FieldType.email:
                return const EmailFormField();
              case FieldType.password:
                return const PasswordFormField();
              case FieldType.confirmPassword:
                return const PasswordFormField(fieldLabel: "Confirmar senha");
              default:
                return const Text("");
            }
          }).toList(),
          ElevatedButton(
            onPressed: onSubmit,
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }
}

class EmailFormField extends StatelessWidget {
  const EmailFormField({
    Key? key,
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
  final String fieldLabel;
  const PasswordFormField({Key? key, this.fieldLabel = "Senha"})
      : super(key: key);

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _obscureText = true;

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
