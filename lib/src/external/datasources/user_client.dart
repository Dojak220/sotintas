import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sotintas/src/domain/repositories/user_repository.dart';
import 'package:sotintas/src/external/models/user.dart';

part "user_client.g.dart";

@RestApi()
abstract class UserClient implements UserRepository {
  factory UserClient(Dio dio, {String baseUrl}) = _UserClient;

  @override
  @GET("/users/{id}")
  Future<User> getUserById(@Path("id") int id);
}
