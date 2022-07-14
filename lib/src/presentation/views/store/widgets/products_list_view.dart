import 'package:flutter/material.dart';
import 'package:sotintas/src/presentation/controllers/store_controller.dart';
import 'package:sotintas/src/presentation/views/store/widgets/product_card.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final StoreController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: controller.productCount,
      itemBuilder: ((_, i) {
        return ProductCard(controller.products![i]!);
      }),
      separatorBuilder: (context, index) => const SizedBox(height: 10),
    );
  }
}