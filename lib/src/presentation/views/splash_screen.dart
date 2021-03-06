import 'package:flutter/material.dart';
import 'package:sotintas/src/presentation/views/home_screen.dart';
import 'package:sotintas/src/presentation/views/login/login_screen.dart';
import 'package:sotintas/src/utils/authentication.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const routeName = "splash_screen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.wait<bool>([
      Authentication.authenticated(),
    ]).then((value) {
      final isAuth = value[0];
      isAuth
          ? Navigator.of(context).pushReplacementNamed(HomeScreen.routeName)
          : Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
