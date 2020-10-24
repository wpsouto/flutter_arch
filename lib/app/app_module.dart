import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_arch/app/app_controller.dart';
import 'package:flutter_arch/app/app_widget.dart';
import 'package:flutter_arch/app/core/interfaces/local_storage_interface.dart';
import 'package:flutter_arch/app/core/services/client_http_service.dart';
import 'package:flutter_arch/app/core/services/shared_local_storage_service.dart';
import 'package:flutter_arch/app/core/viewmodels/change_theme_viewmodel.dart';
import 'package:flutter_arch/app/modules/home/home_module.dart';
import 'package:flutter_arch/app/modules/login/login_module.dart';
import 'core/interfaces/client_http_service_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds {
    return [
      Bind<IClientHttp>((i) => ClientHttpService()),
      Bind((i) => AppController(i.get()), lazy: false),
      Bind((i) => ChangeThemeViewModel(storage: i.get())),
      Bind<ILocalStorage>((i) => SharedLocalStorageService()),
    ];
  }

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: LoginModule()),
        ModularRouter('/home', module: HomeModule()),
      ];
}
