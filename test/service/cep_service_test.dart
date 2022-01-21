import 'dart:convert';

import 'package:cep/Model/cep_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import 'package:cep/service/cep_service.dart';
import 'package:mocktail/mocktail.dart';

class ClientMock extends Mock implements http.Client {}

void main() {
  final client = ClientMock();
  final service = CepService(client);
  const cep = '39400412';
  var body = '''{
      "cep": "39400-412",
      "logradouro": "Rua Divinópolis",
      "complemento": "",
      "bairro": "Santa Rita I",
      "localidade": "Montes Claros",
      "uf": "MG",
      "ibge": "3143302",
      "gia": "",
      "ddd": "38",
      "siafi": "4865"
    }''';
  var url = Uri.parse('https://viacep.com.br/ws/$cep/json/');
  test('testing the api call', () async {
    when(() => client.get(url))
        .thenAnswer((_) async => http.Response(body, 200));
    var city = await service.fetchCep(cep);

    expect(city.localidade, "Montes Claros");
  });

  group('testing the model Serialization', () {
    var responseBody = {
      "cep": "39400-412",
      "logradouro": "Rua Divinópolis",
      "complemento": "",
      "bairro": "Santa Rita I",
      "localidade": "Montes Claros",
      "uf": "MG",
      "ibge": "3143302",
      "gia": "",
      "ddd": "38",
      "siafi": "4865"
    };
    test('test fromMap function should return a CepModel', () {
      var cepModel = CepModel.fromMap(responseBody);
      expect(cepModel.uf, 'MG');

      var json = jsonDecode(cepModel.toJson());
      expect(json['uf'], 'MG');
    });
    test('test toJson function should return a Map', () {
      var cepModel = CepModel(
          cep: '39400-412',
          logradouro: 'Rua Divinópolis',
          complemento: '',
          bairro: 'Santa Rita I',
          localidade: 'Montes Claros',
          uf: 'MG',
          ibge: '3143302',
          gia: '',
          ddd: '38',
          siafi: '4865');
      var json = jsonDecode(cepModel.toJson());
      expect(json['uf'], 'MG');
    });
  });
}
