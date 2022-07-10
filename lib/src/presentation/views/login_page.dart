import 'package:flutter/material.dart';
import 'package:sotintas/src/presentation/views/store_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

/// This class is the state of the [LoginPage] widget.
class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.brush),
                Text("SóTintas"),
              ],
            ),
            const Text("Entrar na plataforma"),
            const Text("Email"),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const Text("Senha"),
            TextField(
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
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const StoreScreen(),
                ),
              ),
              child: const Text("Login"),
            ),
            TextButton(
              onPressed: () {
                print("Criar conta");
              },
              child: const Text("Criar conta"),
            )
          ],
        ),
      ),
    );
  }
}
