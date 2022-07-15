import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sotintas/src/external/models/product.dart';
import 'package:sotintas/src/presentation/controllers/product_detail_controller.dart';
import 'package:sotintas/src/presentation/stores/product_store.dart';
import 'package:sotintas/src/presentation/views/ink_detail/ink_detail_screen.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard(
    this.product, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        product.coverImage,
        height: MediaQuery.of(context).size.height * 0.08,
        loadingBuilder: (_, child, loadingProgress) {
          return loadingProgress == null
              ? child
              : const CircularProgressIndicator();
        },
      ),
      subtitle: Text(product.price.toString()),
      title: Text(product.name),
      trailing: TextButton(
        onPressed: () {},
        child: product.deliveryFree
            ? const Text("Entrega grátis")
            : const SizedBox(),
      ),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) => ProductDetailScreen(
            product: product,
            controller: ProductDetailController(GetIt.I.get<ProductStore>()),
          ),
        ),
      ),
    );
  }
}
