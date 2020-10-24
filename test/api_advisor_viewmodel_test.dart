import 'package:flutter_arch/app/app_module.dart';
import 'package:flutter_arch/app/core/interfaces/client_http_service_interface.dart';
import 'package:flutter_arch/app/modules/home/home_module.dart';
import 'package:flutter_arch/app/modules/home/models/api_advisor_model.dart';
import 'package:flutter_arch/app/modules/home/viewmodels/api_advisor_viewmodel.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class ClientHttpMockito extends Mock implements IClientHttp {}

main() {
  initModule(AppModule(), changeBinds: [
    Bind<IClientHttp>((i) => ClientHttpMockito()),
  ]);

  initModule(HomeModule());

  group('ApiAdvisorViewModel', () {
    test('ApiAdvisorViewModel error', () async {
      when(Modular.get<IClientHttp>().get(
              'http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=f3c063ab22f8e51e9c682892ad498c4d'))
          .thenThrow(Exception('error'));

      final viewModel = Modular.get<ApiAdvisorViewModel>();
      await viewModel.fill();
      expect(viewModel.apiAdvisorModel.value, null);
    });

    test('ApiAdvisorViewModel sucess', () async {
      when(Modular.get<IClientHttp>().get(
              'http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=f3c063ab22f8e51e9c682892ad498c4d'))
          .thenAnswer((_) => Future.value([
                ApiAdvisorModel(country: "BR", date: "2020/05/30", text: "chuva").toJson(),
              ]));

      final viewModel = Modular.get<ApiAdvisorViewModel>();
      await viewModel.fill();
      expect(viewModel.apiAdvisorModel.value, isA<ApiAdvisorModel>());
    });
  });
}
