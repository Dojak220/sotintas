import 'package:get_it/get_it.dart';
import 'package:sotintas/src/domain/repositories/product_repository.dart';
import 'package:sotintas/src/external/models/product.dart';
import 'package:sotintas/src/presentation/usecases/i_get_products.dart';

class GetProducts implements IGetProducts {
  @override
  Future<List<Product>> call() async {
    return GetIt.I.get<ProductRepository>().getProducts();
  }
}
