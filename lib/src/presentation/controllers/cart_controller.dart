import 'package:sotintas/src/external/models/cart_item.dart';
import 'package:sotintas/src/external/models/product.dart';
import 'package:sotintas/src/presentation/stores/product_store.dart';

class CartController {
  final ProductStore productStore;

  CartController(this.productStore);

  List<CartItem>? get cartProducts => productStore.cartProducts;
  int get cartProductCount => productStore.cartProductCount;
  bool get isFetchingProducts => productStore.loadingCartProducts;

  void getCartProducts() {
    productStore.getCartProducts();
  }

  void addProductToCart(Product product) {
    productStore.addToCart(product);
  }

  void removeProductFromCart(Product product) {
    productStore.removeFromCart(product);
  }

  void clearCart() {
    productStore.clearCart();
  }
}
