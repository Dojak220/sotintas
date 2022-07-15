import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sotintas/src/presentation/controllers/cart_controller.dart';
import 'package:sotintas/src/presentation/views/cart/widgets/cart_product_card.dart';

import 'package:sotintas/src/presentation/widgets/custom_appbar.dart';

class CartScreen extends StatefulWidget {
  final CartController controller;

  const CartScreen({Key? key, required this.controller}) : super(key: key);

  static const routeName = "cart_screen";

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    widget.controller.getCartProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Carrinho"),
      body: SafeArea(
        child: Column(
          children: [
            Observer(
              builder: (context) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.70,
                  child: (widget.controller.isFetchingProducts)
                      ? const Center(child: CircularProgressIndicator())
                      : widget.controller.productStore.cartProductCount == 0
                          ? const Center(child: Text("Carrinho vazio"))
                          : CartProductsListView(controller: widget.controller),
                );
              },
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

class CartProductsListView extends StatelessWidget {
  const CartProductsListView({
    Key? key,
    required CartController controller,
  })  : _controller = controller,
        super(key: key);

  final CartController _controller;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _controller.cartProductCount,
      itemBuilder: ((_, i) {
        return CartProductCard(cartProduct: _controller.cartProducts![i]);
    }),
      separatorBuilder: (context, index) => const SizedBox(height: 10),
    );
  }
}
