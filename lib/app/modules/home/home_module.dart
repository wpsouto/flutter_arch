import 'package:flutter_arch/app/modules/home/repositories/api_advisor_repository.dart';
import 'package:flutter_arch/app/modules/home/repositories/api_advisor_repository_interface.dart';
import 'package:flutter_arch/app/modules/home/viewmodels/api_advisor_viewmodel.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  // TODO: implement binds
  List<Bind> get binds => [
    Bind((i) => HomeController(i.get())),
    Bind((i) => ApiAdvisorViewModel(i.get())),
    Bind<IApiAdvisor>((i) => ApiAdvisorRepository(i.get())),
  ];

  @override
  // TODO: implement routers
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (context, args) => HomePage()),
      ];
}
