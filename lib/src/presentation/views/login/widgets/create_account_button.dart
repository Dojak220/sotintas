import 'package:flutter/material.dart';
import 'package:sotintas/src/presentation/views/create_account_screen.dart';

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
