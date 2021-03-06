import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sotintas/src/presentation/controllers/cart_controller.dart';
import 'package:sotintas/src/presentation/controllers/login_controller.dart';
import 'package:sotintas/src/presentation/controllers/store_controller.dart';
import 'package:sotintas/src/presentation/views/cart/cart_screen.dart';
import 'package:sotintas/src/presentation/views/create_account_screen.dart';
import 'package:sotintas/src/presentation/views/home_screen.dart';
import 'package:sotintas/src/presentation/views/login/login_screen.dart';
import 'package:sotintas/src/presentation/views/splash_screen.dart';
import 'package:sotintas/src/presentation/views/store/store_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (_) => const SplashScreen(),
  LoginScreen.routeName: (_) =>
      LoginScreen(controller: GetIt.I.get<LoginController>()),
  CreateAccountScreen.routeName: (_) => const CreateAccountScreen(),
  HomeScreen.routeName: (_) => const HomeScreen(),
  StoreScreen.routeName: (_) {
    return StoreScreen(controller: GetIt.I.get<StoreController>());
  },
  CartScreen.routeName: (_) {
    return CartScreen(controller: GetIt.I.get<CartController>());
  },
};
