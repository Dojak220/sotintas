import 'package:sotintas/src/external/models/cart_item.dart';
import 'package:sotintas/src/external/models/product.dart';
import 'package:sotintas/src/external/models/quality.dart';

abstract class ProductRepository {
  /// Store
  Future<List<Product>> getProducts();
  Future<List<Product>> getProductsByName(String name);
  Future<List<Product>> getDeliveryFreeProducts();
  Future<List<Product>> getDeliveryFreeProductsByName(String name);

  /// Product
  Future<List<Quality>> getProductQualities(String productId);
  /// Cart
  Future<List<CartItem>> getCartProducts();
}
