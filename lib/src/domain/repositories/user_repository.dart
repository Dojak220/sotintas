
import 'package:sotintas/src/external/models/user.dart';

abstract class UserRepository {
  Future<User> getUserById(int id);
}
