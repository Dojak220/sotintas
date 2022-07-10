import 'package:sotintas/src/external/models/product.dart';

abstract class IGetProducts {
  Future<List<Product>> call();
}
