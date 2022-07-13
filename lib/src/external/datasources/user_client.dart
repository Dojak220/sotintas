import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sotintas/src/domain/repositories/user_repository.dart';

part "user_client.g.dart";

@RestApi()
abstract class UserClient implements UserRepository {
  factory UserClient(Dio dio, {String baseUrl}) = _UserClient;

  @override
  @GET("/login")
  Future<String> getUserToken(@Body() String email, @Body() String password);
}
