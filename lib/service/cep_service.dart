// ignore_for_file: unnecessary_this

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:cep/Model/cep_model.dart';

class CepService {
  final http.Client client;
  CepService([http.Client? client]) : this.client = client ?? http.Client();

  Future<CepModel> fetchCep(String cep) async {
    var url = Uri.parse('https://viacep.com.br/ws/$cep/json/');
    //var url = Uri.parse('xxxxxx');
    try {
      final response = await client.get(url);
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      var city = CepModel.fromMap(json);
      return city;
    } on Exception catch (e) {
      throw Exception('Error: $e ');
    }
  }
}
