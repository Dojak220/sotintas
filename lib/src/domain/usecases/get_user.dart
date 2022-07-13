import 'package:get_it/get_it.dart';
import 'package:sotintas/src/domain/repositories/user_repository.dart';
import 'package:sotintas/src/presentation/usecases/i_get_user.dart';

class GetUser implements IGetUser {
  @override
  Future<String> call(String email, String password) async {
    return GetIt.I.get<UserRepository>().getUserToken(email, password);
  }
}
