import 'package:sotintas/src/external/models/product_image.dart';

abstract class IGetProductImages {
  Future<List<ProductImage>> call(String productId);
}
