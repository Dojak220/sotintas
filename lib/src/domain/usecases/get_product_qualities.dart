import 'package:get_it/get_it.dart';
import 'package:sotintas/src/domain/repositories/product_repository.dart';
import 'package:sotintas/src/presentation/usecases/i_get_product_qualities.dart';
import 'package:sotintas/src/external/models/quality.dart';

class GetProductQualities implements IGetProductQualities {
  @override
  Future<List<Quality>> call(String productId) async {
    return await GetIt.I
        .get<ProductRepository>()
        .getProductQualities(productId);
  }
}
