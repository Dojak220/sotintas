import 'package:get_it/get_it.dart';

import 'package:sotintas/src/domain/repositories/product_repository.dart';
import 'package:sotintas/src/domain/repositories/user_repository.dart';
import 'package:sotintas/src/domain/usecases/get_products.dart';
import 'package:sotintas/src/domain/usecases/get_user.dart';
import 'package:sotintas/src/external/datasources/product_client.dart';
import 'package:sotintas/src/external/datasources/user_client.dart';
import 'package:sotintas/src/presentation/stores/product_store.dart';
import 'package:sotintas/src/presentation/stores/user_store.dart';
import 'package:sotintas/src/presentation/usecases/i_get_products.dart';
import 'package:sotintas/src/presentation/usecases/i_get_user.dart';

import 'package:sotintas/src/utils/dio_config.dart';

void setupGetIt() {
  //Stores
  GetIt.I.registerSingleton<ProductStore>(ProductStore());
  GetIt.I.registerSingleton<UserStore>(UserStore());

  //Datasources
  GetIt.I.registerSingleton<ProductRepository>(ProductClient(DioConfig().dio));
  GetIt.I.registerSingleton<UserRepository>(UserClient(DioConfig().dio));

  //Usecases
  GetIt.I.registerSingleton<IGetProducts>(GetProducts());
  GetIt.I.registerSingleton<IGetUser>(GetUser());
}
