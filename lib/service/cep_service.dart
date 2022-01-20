import 'package:cep/Model/cep_model.dart';

class CepService {
  Future<List<CepModel>> fetchCep(String cep) async {
    var url = 'https://viacep.com.br/ws/$cep/json/';

    return [];
  }
}
