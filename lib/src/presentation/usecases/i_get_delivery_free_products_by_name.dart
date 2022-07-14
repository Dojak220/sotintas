import 'package:sotintas/src/external/models/product.dart';

abstract class IGetDeliveryFreeProductsByName {
  Future<List<Product>> call(String name);
}
