import 'package:cep/Model/cep_model.dart';
import 'package:cep/service/cep_service.dart';
import 'package:flutter/cupertino.dart';

class CepController extends ValueNotifier {
  final CepService service;

  late CepModel city;

  CepController(this.service) : super(null);

  Future fetchCep(String cep) async {
    city = await service.fetchCep(cep);
  }
}
