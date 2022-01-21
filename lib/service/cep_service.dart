import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:cep/Model/cep_model.dart';

class CepService {
  http.Client? client;
  CepService([http.Client? client]) {
    if (client == null) {
      this.client = http.Client();
    } else {
      this.client = client;
    }
  }

  Future<CepModel> fetchCep(String cep) async {
    var url = Uri.parse('https://viacep.com.br/ws/$cep/json/');
    try {
      final response = await client!.get(url);
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      print(response.body);
      var city = CepModel.fromMap(json);
      return city;
    } on Exception catch (e) {
      throw Exception('Error: $e ');
    }
  }
}
