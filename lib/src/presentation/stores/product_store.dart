import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import 'package:sotintas/src/external/models/product.dart';
import 'package:sotintas/src/presentation/usecases/i_get_delivery_free_products.dart';
import 'package:sotintas/src/presentation/usecases/i_get_delivery_free_products_by_name.dart';
import 'package:sotintas/src/presentation/usecases/i_get_products.dart';
import 'package:sotintas/src/presentation/usecases/i_get_products_by_name.dart';
import 'package:sotintas/src/utils/misc.dart';

part 'product_store.g.dart';

class ProductStore = _ProductStore with _$ProductStore;

abstract class _ProductStore with Store {
  @observable
  List<Product?>? products;

  @computed
  int get productCount => products!.length;

  @observable
  bool freeShippingFilter = false;

  @observable
  bool loading = false;

  @action
  Future<void> getProducts([String? search]) async {
    freeShippingFilter = false;

    try {
      loading = true;
      products = await (search == null
          ? GetIt.I.get<IGetProducts>()()
          : GetIt.I.get<IGetProductsByName>()(search));
    } catch (e, s) {
      printException("ProductStore.getProduct", e, s);
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> filterByDeliveryFree([String? search]) async {
    freeShippingFilter = true;
    try {
      loading = true;
      products = await (search == null
          ? GetIt.I.get<IGetDeliveryFreeProducts>()()
          : GetIt.I.get<IGetDeliveryFreeProductsByName>()(search));
    } catch (e, s) {
      printException("ProductStore.filterByDeliveryFree", e, s);
    } finally {
      loading = false;
    }
  }
}
