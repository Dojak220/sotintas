import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import 'package:sotintas/src/external/models/user.dart';
import 'package:sotintas/src/presentation/usecases/i_get_user.dart';
import 'package:sotintas/src/utils/misc.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  @observable
  User? user;

  @observable
  bool loading = false;

  @action
  Future<bool> getUser(String email, String password) async {
    try {
      loading = true;

      user = User(email: email, password: password);

      final token = await GetIt.I.get<IGetUser>()(email, password);
      user = user!.copyWith(token: token);

      return true;
    } catch (e, s) {
      printException("UserStore.getUser", e, s);
      return false;
    } finally {
      loading = false;
    }
  }
}
