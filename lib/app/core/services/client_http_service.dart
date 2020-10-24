import 'package:dio/dio.dart';
import 'package:flutter_arch/app/core/interfaces/client_http_service_interface.dart';

class ClientHttpService implements IClientHttp {
  final Dio dio = Dio();

  @override
  void addToken(String token) {
    // TODO: implement addToken
  }

  @override
  Future get(String url) async {
    var response = await dio.get(url);
    return response.data;
  }
  
}