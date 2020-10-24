import 'package:flutter/material.dart';
import 'models/api_advisor_model.dart';
import 'viewmodels/api_advisor_viewmodel.dart';

class HomeController {
  final ApiAdvisorViewModel viewModel;

  HomeController(this.viewModel);

  ValueNotifier<ApiAdvisorModel> get time => viewModel.apiAdvisorModel;

  getTime(){
    viewModel.fill();
  }
}