import 'package:cep/Controller/cep_controller.dart';
import 'package:flutter/material.dart';

class InitialCep extends StatelessWidget {
  final txtController = TextEditingController();

  final CepController cepController;
  InitialCep({
    Key? key,
    required this.cepController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}
