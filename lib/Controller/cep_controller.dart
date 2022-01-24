import 'package:cep/Model/cep_model.dart';
import 'package:cep/service/cep_service.dart';
import 'package:flutter/cupertino.dart';

class CepController extends ValueNotifier {
  final CepService service;
  HomeState state = HomeState.initial;

  CepModel? city;

  CepController(this.service) : super(null);

  Future fetchCep(String cep) async {
    state = HomeState.loading;
    try {
      city = await service.fetchCep(cep);
      state = HomeState.success;
    } on Exception catch (e) {
      state = HomeState.error;
    }
  }
}

enum HomeState { initial, loading, success, error }
