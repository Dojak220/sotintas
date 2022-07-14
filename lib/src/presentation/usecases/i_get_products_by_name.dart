import 'package:sotintas/src/external/models/product.dart';

abstract class IGetProductsByName {
  Future<List<Product>> call(String name);
}
