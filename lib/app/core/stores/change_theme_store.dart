import 'package:flutter_arch/app/core/interfaces/local_storage_interface.dart';
import 'package:flutter_arch/app/core/models/app_config_model.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'change_theme_store.g.dart';

@Injectable()
class ChangeThemeStore = _ChangeThemeStoreBase with _$ChangeThemeStore;

abstract class _ChangeThemeStoreBase with Store {
  // final ILocalStorage storage;
  // final AppConfigModel config = AppConfigModel();


}
