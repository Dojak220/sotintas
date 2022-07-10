import 'package:sotintas/src/external/models/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
}
