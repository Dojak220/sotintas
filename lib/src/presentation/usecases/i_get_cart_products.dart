import 'package:sotintas/src/external/models/cart_item.dart';

abstract class IGetCartProducts {
  Future<List<CartItem>> call();
}
