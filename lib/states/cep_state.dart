import 'package:cep/Model/cep_model.dart';

abstract class CepState {}

class InitialCepSate extends CepState {}

class LoadingCepSate extends CepState {}

class SuccessCepSate extends CepState {
  final CepModel city;

  SuccessCepSate(this.city);
}

class ErrorCepSate extends CepState {
  final String error;

  ErrorCepSate(this.error);
}
