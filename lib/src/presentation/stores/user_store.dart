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
  Future<void> getUsers() async {
    try {
      loading = true;
      user = await GetIt.I.get<IGetUser>()();
    } catch (e, s) {
      printException("UserStore.getUser", e, s);
    } finally {
      loading = false;
    }
  }
}
