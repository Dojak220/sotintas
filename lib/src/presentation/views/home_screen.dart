import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sotintas/src/presentation/controllers/store_controller.dart';
import 'package:sotintas/src/presentation/stores/user_store.dart';
import 'package:sotintas/src/presentation/views/cart/cart_screen.dart';
import 'package:sotintas/src/presentation/views/profile_screen.dart';
import 'package:sotintas/src/presentation/views/store/store_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = "home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    StoreScreen(controller: GetIt.I.get<StoreController>()),
    const CartScreen(),
    ProfileScreen(store: GetIt.I.get<UserStore>()),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const CustomAppBar(title: "Opções de tintas"),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront),
            label: "Loja",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Carrinho",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Perfil",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
