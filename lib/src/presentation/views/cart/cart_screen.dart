import 'package:flutter/material.dart';
import 'package:sotintas/src/presentation/views/cart/widgets/cart_product_card.dart';

import 'package:sotintas/src/presentation/widgets/custom_appbar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const routeName = "cart_screen";

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Carrinho"),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.70,
              child: ListView.separated(
                itemCount: 10,
                itemBuilder: ((_, i) {
                  return const CartProductCard();
                }),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
              ),
            ),
            const Expanded(child: SizedBox()),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Adicionar ao carrinho"),
            ),
          ],
        ),
      ),
    );
  }
}
