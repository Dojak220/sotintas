import 'package:get_it/get_it.dart';
import 'package:sotintas/src/domain/repositories/product_repository.dart';
import 'package:sotintas/src/external/models/product.dart';
import 'package:sotintas/src/presentation/usecases/i_get_delivery_free_products.dart';

class GetDeliveryFreeProducts implements IGetDeliveryFreeProducts {
  @override
  Future<List<Product>> call() async {
    return await GetIt.I.get<ProductRepository>().getDeliveryFreeProducts();
  }
}
