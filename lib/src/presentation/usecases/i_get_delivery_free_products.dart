import 'package:sotintas/src/external/models/product.dart';

abstract class IGetDeliveryFreeProducts {
  Future<List<Product>> call();
}
