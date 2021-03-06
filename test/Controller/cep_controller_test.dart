import 'package:cep/Controller/cep_controller.dart';
import 'package:cep/Model/cep_model.dart';
import 'package:cep/service/cep_service.dart';
import 'package:cep/states/cep_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ServiceMock extends Mock implements CepService {}

void main() {
  final mockService = ServiceMock();
  final sut = CepController(mockService);
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
  test('When Sut called should instatiate city with a cepModel instance',
      () async {
    when(() => mockService.fetchCep(any())).thenAnswer((_) async => cepModel);

    await sut.fetchCep('39400412');

    expect(sut.city?.localidade, "Montes Claros");
    verify(() => mockService.fetchCep('39400412')).called(1);
  });

  test('When Sut called should return the correct state', () async {
    when(() => mockService.fetchCep(any())).thenAnswer((_) async => cepModel);
    sut.value = InitialCepSate();
    expect(sut.value, isA<InitialCepSate>());
    await sut.fetchCep('39400412');
    expect(sut.value, isA<SuccessCepSate>());
  });

  test('When Sut called should throw error', () async {
    when(() => mockService.fetchCep(any())).thenThrow(Exception());
    sut.value = InitialCepSate();
    expect(sut.value, isA<InitialCepSate>());
    await sut.fetchCep('39400412');
    expect(sut.value, isA<ErrorCepSate>());
  });
}
