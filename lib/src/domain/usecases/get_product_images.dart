import 'package:get_it/get_it.dart';
import 'package:sotintas/src/domain/repositories/product_repository.dart';
import 'package:sotintas/src/external/models/product_image.dart';
import 'package:sotintas/src/presentation/usecases/i_get_product_images.dart';

class GetProductImages implements IGetProductImages {
  @override
  Future<List<ProductImage>> call(String productId) async {
    return await GetIt.I
        .get<ProductRepository>()
        .getProductImages(productId);
  }
}
