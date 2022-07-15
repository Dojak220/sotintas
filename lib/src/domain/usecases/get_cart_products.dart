import 'package:get_it/get_it.dart';
import 'package:sotintas/src/domain/repositories/product_repository.dart';
import 'package:sotintas/src/external/models/cart_item.dart';
import 'package:sotintas/src/presentation/usecases/i_get_cart_products.dart';

class GetCartProducts implements IGetCartProducts {
  @override
  Future<List<CartItem>> call() async {
    return await GetIt.I.get<ProductRepository>().getCartProducts();
  }
}
