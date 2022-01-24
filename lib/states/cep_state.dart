abstract class CepState {}

class InitialCepSate extends CepState {}

class LoadingCepSate extends CepState {}

class SuccessCepSate extends CepState {}

class ErrorCepSate extends CepState {
  final String error;

  ErrorCepSate(this.error);
}
