import 'package:cep/Controller/cep_controller.dart';
import 'package:cep/states/cep_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class ErrorCep extends StatelessWidget {
  // const ErrorCep(
  //   this.cepController,
  // ) : super();

  // final CepController cepController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('An Error occurred, check your entry!'),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            context.read<CepController>().value = InitialCepSate();
          },
          child: const Text('Try Again'),
        ),
      ],
    );
  }
}
