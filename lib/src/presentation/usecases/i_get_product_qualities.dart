import 'package:sotintas/src/external/models/quality.dart';

abstract class IGetProductQualities {
  Future<List<Quality>> call(String productId);
}
