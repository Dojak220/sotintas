import 'package:flutter/material.dart';
import 'package:sotintas/src/presentation/views/splash_screen.dart';

import 'src/utils/custom_colors.dart';
import 'src/utils/routes.dart';
import 'src/utils/setups/setup_flavors.dart';
import 'src/utils/setups/setup_get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SetupFlavors setupFlavors = SetupFlavors();
  await setupFlavors.setup();
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Só Tintas',
      theme: ThemeData(
        primaryColor: CustomColors.primary,
      ),
      home: const SplashScreen(),
      routes: routes,
    );
  }
}
