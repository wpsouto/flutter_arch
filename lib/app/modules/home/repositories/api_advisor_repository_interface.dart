import 'package:flutter_arch/app/modules/home/models/api_advisor_model.dart';

abstract class IApiAdvisor {
  Future<ApiAdvisorModel> getTime();
}