import 'package:flutter/material.dart';
import 'package:sotintas/src/external/models/product.dart';
import 'package:sotintas/src/presentation/stores/product_store.dart';

class StoreController {
  final ProductStore productStore;

  StoreController(this.productStore);

  final searchController = TextEditingController();

  List<Product?>? get products => productStore.products;
  bool get isFetchingProducts => productStore.loading;
  int get productCount => productStore.productCount;
  bool get freeShippingFilter => productStore.freeShippingFilter;
  set freeShippingFilter(bool value) => productStore.freeShippingFilter = value;

  void getProducts() {
    String? search;
    final bool searchTextHasMinLength = searchController.text.length > 3;

    if (searchTextHasMinLength) {
      search = searchController.text;
    }

    productStore.getProducts(search);
  }

  void filterByDeliveryFree() {
    String? search;
    final bool searchTextHasMinLength = searchController.text.length > 3;

    if (searchTextHasMinLength) {
      search = searchController.text;
    }

    productStore.filterByDeliveryFree(search);
  }
}
