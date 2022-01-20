import 'package:flutter_test/flutter_test.dart';

import 'package:cep/service/cep_service.dart';

void main() {
  final service = CepService();
  final city = '39400412';
  test('testing the api call', () async {
    var code = await service.fetchCep(city);

    expect(code, 200);
  });
}
