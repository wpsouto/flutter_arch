import 'package:flutter_arch/app/core/interfaces/local_storage_interface.dart';
import 'package:flutter_arch/app/core/models/app_config_model.dart';

class ChangeThemeViewModel {
  final ILocalStorage storage;
  final AppConfigModel config = AppConfigModel();

  ChangeThemeViewModel({this.storage});

  Future init() async {
    await storage.get('isDark').then((value) {
      if (value != null) {
        config.themeSwitch.value = value;
      }
    });
  }

  changeTheme(bool value) {
    config.themeSwitch.value = value;
    storage.put('isDark', value);
  }
}
