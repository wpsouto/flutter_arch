import 'package:flutter/material.dart';
import 'package:flutter_arch/app/modules/home/models/api_advisor_model.dart';
import 'package:flutter_arch/app/modules/home/repositories/api_advisor_repository_interface.dart';

class ApiAdvisorViewModel {
  final IApiAdvisor repository;
  final apiAdvisorModel = ValueNotifier<ApiAdvisorModel>(null);

  ApiAdvisorViewModel(this.repository);

  fill() async {
    try {
      apiAdvisorModel.value = await repository.getTime();
    } catch (e) {
    }
  }
}
