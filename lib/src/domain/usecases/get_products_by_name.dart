import 'package:get_it/get_it.dart';
import 'package:sotintas/src/domain/repositories/product_repository.dart';
import 'package:sotintas/src/external/models/product.dart';
import 'package:sotintas/src/presentation/usecases/i_get_products_by_name.dart';

class GetProductsByName implements IGetProductsByName {
  @override
  Future<List<Product>> call(String name) async {
    return await GetIt.I.get<ProductRepository>().getProductsByName(name);
  }
}
