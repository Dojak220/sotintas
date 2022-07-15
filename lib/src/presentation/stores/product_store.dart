import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sotintas/src/external/models/cart_item.dart';

import 'package:sotintas/src/external/models/product.dart';
import 'package:sotintas/src/external/models/quality.dart';
import 'package:sotintas/src/presentation/usecases/i_get_cart_products.dart';
import 'package:sotintas/src/presentation/usecases/i_get_delivery_free_products.dart';
import 'package:sotintas/src/presentation/usecases/i_get_delivery_free_products_by_name.dart';
import 'package:sotintas/src/presentation/usecases/i_get_product_qualities.dart';
import 'package:sotintas/src/presentation/usecases/i_get_products.dart';
import 'package:sotintas/src/presentation/usecases/i_get_products_by_name.dart';
import 'package:sotintas/src/utils/misc.dart';

part 'product_store.g.dart';

class ProductStore = _ProductStore with _$ProductStore;

abstract class _ProductStore with Store {
  @observable
  List<Product>? products;
  @computed
  int get productCount => products!.length;

  @observable
  List<CartItem>? cartProducts;
  @computed
  int get cartProductCount => cartProducts!.length;

  @observable
  List<Quality>? productQualities;
  @computed
  int get productQualityCount => productQualities!.length;

  @observable
  bool freeShippingFilter = false;

  @observable
  bool loadingProducts = false;
  @observable
  bool loadingCartProducts = false;
  @observable
  bool loadingQualities = false;

  @action
  Future<void> getProducts([String? search]) async {
    freeShippingFilter = false;

    try {
      loadingProducts = true;
      products = await (search == null
          ? GetIt.I.get<IGetProducts>()()
          : GetIt.I.get<IGetProductsByName>()(search));
    } catch (e, s) {
      printException("ProductStore.getProduct", e, s);
    } finally {
      loadingProducts = false;
    }
  }

  @action
  Future<void> filterByDeliveryFree([String? search]) async {
    freeShippingFilter = true;
    try {
      loadingProducts = true;
      products = await (search == null
          ? GetIt.I.get<IGetDeliveryFreeProducts>()()
          : GetIt.I.get<IGetDeliveryFreeProductsByName>()(search));
    } catch (e, s) {
      printException("ProductStore.filterByDeliveryFree", e, s);
    } finally {
      loadingProducts = false;
    }
  }

  @action
  Future<void> getCartProducts() async {
    try {
      loadingCartProducts = true;
      cartProducts = await GetIt.I.get<IGetCartProducts>()();
    } catch (e, s) {
      // printException("ProductStore.getCartProduct", e, s);
      print(e);
      print(s);
    } finally {
      loadingCartProducts = false;
    }
  }

  @action
  Future<void> getQualities(String productId) async {
    try {
      loadingQualities = true;
      productQualities = await GetIt.I.get<IGetProductQualities>()(productId);
    } catch (e, s) {
      // printException("ProductStore.getQualities", e, s);
      print(e);
      print(s);
    } finally {
      loadingQualities = false;
    }
  }

  @action
  void addToCart(Product product) {
    cartProducts ??= [];

    cartProducts!.add(CartItem(product: product, quantity: 1));
  }

  @action
  void removeFromCart(Product product) {
    cartProducts!.removeWhere((item) => item.product.id == product.id);
  }

  @action
  void clearCart() {
    cartProducts = [];
  }

  @action
  void updateCartProductQuantity(Product product, int quantity) {
    final index = cartProducts!.indexWhere((p) => p.product.id == product.id);
    cartProducts![index] = CartItem(product: product, quantity: quantity);
  }
}
