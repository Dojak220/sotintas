import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import 'package:sotintas/src/external/models/product.dart';
import 'package:sotintas/src/presentation/usecases/i_get_products.dart';
import 'package:sotintas/src/utils/misc.dart';

part 'product_store.g.dart';

class ProductStore = _ProductStore with _$ProductStore;

abstract class _ProductStore with Store {
  @observable
  List<Product?>? products;

  @computed
  int get productCount => products!.length;

  @observable
  bool loading = false;

  @action
  Future<void> getProducts() async {
    try {
      loading = true;
      products = await GetIt.I.get<IGetProducts>()();
    } catch (e, s) {
      printException("ProductStore.getProduct", e, s);
    } finally {
      loading = false;
    }
  }
}
