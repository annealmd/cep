import 'package:cep/Controller/cep_controller.dart';
import 'package:flutter/material.dart';

class SuccessCep extends StatelessWidget {
  const SuccessCep({
    Key? key,
    required this.cepController,
  }) : super(key: key);

  final CepController cepController;

  @override
  Widget build(BuildContext context) {
    final city = cepController.city;
    return (city?.cep == null)
        ? Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'CEP does not exist!',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    cepController.state.value = HomeState.initial;
                  },
                  child: const Text('Search Again'),
                ),
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  '${cepController.city?.localidade}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text('Habitantes: ${cepController.city?.ibge}'),
                const SizedBox(
                  height: 20,
                ),
                Text('Bairro: ${cepController.city?.bairro}'),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    cepController.state.value = HomeState.initial;
                  },
                  child: const Text('Search Again'),
                ),
              ],
            ),
          );
  }
}
