import 'package:flutter_arch/app/core/interfaces/client_http_service_interface.dart';
import 'package:flutter_arch/app/modules/home/models/api_advisor_model.dart';

import 'api_advisor_repository_interface.dart';

class ApiAdvisorRepository implements IApiAdvisor {
  final IClientHttp client;

  ApiAdvisorRepository(this.client);

  @override
  Future<ApiAdvisorModel> getTime() async {
    var json = await client.get(
        'http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=f3c063ab22f8e51e9c682892ad498c4d');

    ApiAdvisorModel model = ApiAdvisorModel.fromJson(json[0]);
    return model;
  }
}
