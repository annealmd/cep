import 'package:cep/Controller/cep_controller.dart';
import 'package:flutter/material.dart';

class ErrorCep extends StatelessWidget {
  const ErrorCep({
    Key? key,
    required this.cepController,
  }) : super(key: key);

  final CepController cepController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('An Error occurred'),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            cepController.state.value = HomeState.initial;
          },
          child: const Text('Try Again'),
        ),
      ],
    );
  }
}
