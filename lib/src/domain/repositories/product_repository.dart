import 'package:sotintas/src/external/models/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
  Future<List<Product>> getProductsByName(String name);
  Future<List<Product>> getDeliveryFreeProducts();
  Future<List<Product>> getDeliveryFreeProductsByName(String name);
}
