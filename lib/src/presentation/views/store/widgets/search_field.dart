import 'package:flutter/material.dart';
import 'package:sotintas/src/presentation/controllers/store_controller.dart';
import 'package:sotintas/src/utils/helpers/display_size_helper.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key, required this.controller}) : super(key: key);

  final StoreController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: displayUsableHeight(context) * 0.08,
      child: TextFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
          ),
          prefixIcon: Icon(Icons.search_rounded),
          hintText: "Buscar...",
        ),
        controller: controller.searchController,
        onEditingComplete: () {
          controller.freeShippingFilter
              ? controller.filterByDeliveryFree()
              : controller.getProducts();
        },
      ),
    );
  }
}
