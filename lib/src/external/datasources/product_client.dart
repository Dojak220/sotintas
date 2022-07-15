import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sotintas/src/domain/repositories/product_repository.dart';
import 'package:sotintas/src/external/models/cart_item.dart';
import 'package:sotintas/src/external/models/product.dart';
import 'package:sotintas/src/external/models/product_image.dart';
import 'package:sotintas/src/external/models/quality.dart';

part "product_client.g.dart";

@RestApi()
abstract class ProductClient implements ProductRepository {
  factory ProductClient(Dio dio, {String baseUrl}) = _ProductClient;

  @override
  @GET("/paint?page=1&limit=10")
  Future<List<Product>> getProducts();

  @override
  @GET("/paint?page=1&limit=10&name={name}")
  Future<List<Product>> getProductsByName(@Path() String name);

  @override
  @GET("/paint?page=1&limit=10&deliveryFree=true")
  Future<List<Product>> getDeliveryFreeProducts();

  @override
  @GET("/paint?page=1&limit=10&name={name}&deliveryFree=true")
  Future<List<Product>> getDeliveryFreeProductsByName(@Path() String name);

  @override
  @GET("/paint/{productId}/differential")
  Future<List<Quality>> getProductQualities(@Path() String productId);

  @override
  @GET("/paint/{productId}/image")
  Future<List<ProductImage>> getProductImages(@Path() String productId);

  @override
  @GET("/cart?page=1&limit=10")
  Future<List<CartItem>> getCartProducts();
}
