import 'package:cep/Model/cep_model.dart';
import 'package:cep/service/cep_service.dart';
import 'package:flutter/cupertino.dart';

class CepController extends ValueNotifier {
  final CepService service;
  final state = ValueNotifier<HomeState>(HomeState.initial);

  CepModel? city;

  CepController(this.service) : super(null);

  Future fetchCep(String cep) async {
    state.value = HomeState.loading;
    try {
      city = await service.fetchCep(cep);
      state.value = HomeState.success;
    } on Exception catch (e) {
      state.value = HomeState.error;
    }
  }
}

enum HomeState { initial, loading, success, error }
