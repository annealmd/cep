import 'package:cep/Controller/cep_controller.dart';
import 'package:cep/service/cep_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final txtController = TextEditingController();
  final service = CepService();
  // ignore: non_constant_identifier_names

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CepController cepController = CepController(service);
    return Card(
      margin: const EdgeInsets.all(20),
      elevation: 10,
      shadowColor: Colors.cyan,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Encontre o Endereço'),
            const SizedBox(
              height: 40,
            ),
            TextField(
              controller: txtController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.house_outlined),
                labelText: 'CEP',
                hintText: '00000000',
                hintStyle: TextStyle(color: Colors.black45, fontSize: 12),
              ),
              textAlign: TextAlign.center,
              maxLength: 8,
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                cepController.fetchCep(txtController.text);
              },
              child: const Text('Enter'),
            ),
            const SizedBox(height: 20),
            Text('${cepController.city?.localidade}'),
          ],
        ),
      ),
    );
  }
}
