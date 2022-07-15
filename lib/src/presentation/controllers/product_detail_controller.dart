import 'package:sotintas/src/external/models/product_image.dart';
import 'package:sotintas/src/external/models/quality.dart';
import 'package:sotintas/src/presentation/stores/product_store.dart';

class ProductDetailController {
  final ProductStore productStore;

  ProductDetailController(this.productStore);

  /// Product differentials getters.
  List<Quality>? get productQualities => productStore.productQualities;
  bool get isFetchingQualities => productStore.loadingQualities;
  int get productQualityCount => productStore.productQualityCount;

  /// Product images getters.
  List<ProductImage>? get productImages => productStore.productImages;
  bool get isFetchingImages => productStore.loadingImages;
  int get productImageCount => productStore.productImageCount;

  void getQualities(String productId) {
    productStore.getQualities(productId);
  }

  void getImages(String productId) {
    productStore.getImages(productId);
  }
}
