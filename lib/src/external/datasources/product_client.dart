import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sotintas/src/domain/repositories/product_repository.dart';
import 'package:sotintas/src/external/models/product.dart';

part "product_client.g.dart";

@RestApi()
abstract class ProductClient implements ProductRepository {
  factory ProductClient(Dio dio, {String baseUrl}) = _ProductClient;

  @override
  @GET("/products")
  Future<List<Product>> getProducts();
}
