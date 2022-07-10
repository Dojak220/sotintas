import 'package:sotintas/src/external/models/user.dart';

abstract class IGetUser {
  Future<User> call();
}
