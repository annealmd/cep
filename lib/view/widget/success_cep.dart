import 'package:cep/Controller/cep_controller.dart';
import 'package:cep/states/cep_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class SuccessCep extends StatelessWidget {
  // const SuccessCep(
  //   this.cepController,
  // ) : super();

  // final CepController cepController;

  @override
  Widget build(BuildContext context) {
    final city = context.read<CepController>().city;
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
                    context.read<CepController>().value = InitialCepSate();
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
                  '${city?.localidade}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text('Habitantes: ${city?.ibge}'),
                const SizedBox(
                  height: 20,
                ),
                Text('Bairro: ${city?.bairro}'),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<CepController>().value = InitialCepSate();
                  },
                  child: const Text('Search Again'),
                ),
              ],
            ),
          );
  }
}
