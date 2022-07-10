import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:sotintas/src/presentation/stores/product_store.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);

  static const routeName = "example_screen";

  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  final exampleStore = GetIt.I.get<ProductStore>();

  bool _freeShippingFilter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text("Opções de tintas"),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                ),
                prefixIcon: Icon(Icons.search_rounded),
                hintText: "Buscar...",
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Switch(
                  value: _freeShippingFilter,
                  onChanged: (newValue) {
                    setState(() => _freeShippingFilter = newValue);
                  },
                ),
                const Text("Apenas "),
                const Text(
                  "entrega grátis",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
                const Spacer(),
                const Text("100 resultados"),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.73,
              child: ListView.separated(
                itemCount: 10,
                itemBuilder: ((_, i) {
                  return ListTile(
                    leading: Image.network(
                      "https://picsum.photos/200",
                    ),
                    subtitle: const Text("R\$ 100,00"),
                    title: const Text("Tinta"),
                    trailing: TextButton(
                      onPressed: () {},
                      child: const Text("Entrega grátis"),
                    ),
                  );
                }),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
              ),
            ),
          ],
        ),
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
        currentIndex: 0,
        onTap: (newIndex) {
          print("Tapped $newIndex");
        },
      ),
    );
  }
}
