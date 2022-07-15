import 'package:get_it/get_it.dart';

import 'package:sotintas/src/domain/repositories/product_repository.dart';
import 'package:sotintas/src/domain/repositories/user_repository.dart';
import 'package:sotintas/src/domain/usecases/get_cart_products.dart';
import 'package:sotintas/src/domain/usecases/get_delivery_free_products.dart';
import 'package:sotintas/src/domain/usecases/get_delivery_free_products_by_name.dart';
import 'package:sotintas/src/domain/usecases/get_products.dart';
import 'package:sotintas/src/domain/usecases/get_products_by_name.dart';
import 'package:sotintas/src/domain/usecases/get_user.dart';
import 'package:sotintas/src/domain/usecases/get_user_profile.dart';
import 'package:sotintas/src/external/datasources/product_client.dart';
import 'package:sotintas/src/external/datasources/user_client.dart';
import 'package:sotintas/src/presentation/controllers/cart_controller.dart';
import 'package:sotintas/src/presentation/controllers/login_controller.dart';
import 'package:sotintas/src/presentation/controllers/store_controller.dart';
import 'package:sotintas/src/presentation/stores/product_store.dart';
import 'package:sotintas/src/presentation/stores/user_store.dart';
import 'package:sotintas/src/presentation/usecases/i_get_cart_products.dart';
import 'package:sotintas/src/presentation/usecases/i_get_delivery_free_products.dart';
import 'package:sotintas/src/presentation/usecases/i_get_delivery_free_products_by_name.dart';
import 'package:sotintas/src/presentation/usecases/i_get_products.dart';
import 'package:sotintas/src/presentation/usecases/i_get_products_by_name.dart';
import 'package:sotintas/src/presentation/usecases/i_get_user.dart';
import 'package:sotintas/src/presentation/usecases/i_get_user_profile.dart';

import 'package:sotintas/src/utils/dio_config.dart';

void setupGetIt() {
  /// Stores
  GetIt.I.registerSingleton<ProductStore>(ProductStore());
  GetIt.I.registerSingleton<UserStore>(UserStore());

  /// Controllers
  GetIt.I.registerSingleton<LoginController>(
    LoginController(GetIt.I.get<UserStore>()),
  );
  GetIt.I.registerSingleton<StoreController>(
    StoreController(GetIt.I.get<ProductStore>()),
  );
  GetIt.I.registerSingleton<CartController>(
    CartController(GetIt.I.get<ProductStore>()),
  );

  /// Datasources
  GetIt.I.registerSingleton<ProductRepository>(ProductClient(DioConfig().dio));
  GetIt.I.registerSingleton<UserRepository>(UserClient(DioConfig().dio));

  /// Usecases
  GetIt.I.registerSingleton<IGetProducts>(GetProducts());
  GetIt.I.registerSingleton<IGetProductsByName>(GetProductsByName());
  GetIt.I.registerSingleton<IGetDeliveryFreeProducts>(
    GetDeliveryFreeProducts(),
  );
  GetIt.I.registerSingleton<IGetDeliveryFreeProductsByName>(
    GetDeliveryFreeProductsByName(),
  );
  GetIt.I.registerSingleton<IGetUser>(GetUser());
  GetIt.I.registerSingleton<IGetUserProfile>(GetUserProfile());

  GetIt.I.registerSingleton<IGetCartProducts>(GetCartProducts());
}
