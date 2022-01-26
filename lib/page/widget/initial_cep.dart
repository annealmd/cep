import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import 'package:cep/Controller/cep_controller.dart';

class InitialCep extends StatelessWidget {
  final txtController = TextEditingController();
  // InitialCep(
  //   this.cepController,
  // ) : super();

  // final CepController cepController;

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
            context.read<CepController>().fetchCep(txtController.text);
          },
          child: const Text('Enter'),
        ),
      ],
    );
  }
}
