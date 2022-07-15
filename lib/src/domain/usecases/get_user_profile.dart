import 'package:get_it/get_it.dart';
import 'package:sotintas/src/domain/repositories/user_repository.dart';
import 'package:sotintas/src/presentation/usecases/i_get_user_profile.dart';

class GetUserProfile implements IGetUserProfile {
  @override
  Future<Map<String, String>> call() async {
    return GetIt.I.get<UserRepository>().getUserProfile();
  }
}
