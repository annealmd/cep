import 'package:cep/Model/cep_model.dart';
import 'package:cep/service/cep_service.dart';
import 'package:cep/states/cep_state.dart';
import 'package:flutter/cupertino.dart';

class CepController extends ValueNotifier<CepState> {
  final CepService service;

  CepModel? city;

  CepController(this.service) : super(InitialCepSate());

  Future fetchCep(String cep) async {
    value = LoadingCepSate();
    try {
      city = await service.fetchCep(cep);
      value = SuccessCepSate(city!);
    } on Exception catch (e) {
      value = ErrorCepSate(e.toString());
    }
  }
}
