import 'package:http/http.dart' as http;

import 'package:cep/Model/cep_model.dart';

class CepService {
  Future<int> fetchCep(String cep) async {
    var url = Uri.parse('https://viacep.com.br/ws/$cep/json/');
    final response = await http.get(url);
    final body = response.body;
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response.statusCode;
  }
}
