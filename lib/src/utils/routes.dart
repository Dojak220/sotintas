import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sotintas/src/presentation/controllers/store_controller.dart';
import 'package:sotintas/src/presentation/views/cart.dart';
import 'package:sotintas/src/presentation/views/create_account_page.dart';
import 'package:sotintas/src/presentation/views/home_screen.dart';
import 'package:sotintas/src/presentation/views/ink_detail_page.dart';
import 'package:sotintas/src/presentation/views/login_page.dart';
import 'package:sotintas/src/presentation/views/splash_screen.dart';
import 'package:sotintas/src/presentation/views/store_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (_) => const SplashScreen(),
  LoginPage.routeName: (_) => const LoginPage(),
  CreateAccountScreen.routeName: (_) => const CreateAccountScreen(),
  HomeScreen.routeName: (_) => const HomeScreen(),
  StoreScreen.routeName: (_) => StoreScreen(
        controller: GetIt.I.get<StoreController>(),
      ),
  CartScreen.routeName: (_) => const CartScreen(),
  InkDetailPage.routeName: (_) => const InkDetailPage(),
};
