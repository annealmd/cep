import 'package:cep/Controller/cep_controller.dart';
import 'package:cep/service/cep_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final txtController = TextEditingController();
  final service = CepService();
  late CepController cepController = CepController(service);
  // ignore: non_constant_identifier_names

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      elevation: 10,
      shadowColor: Colors.cyan,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: stateManagement(HomeState.success),
      ),
    );
  }

  Widget stateManagement(HomeState state) {
    switch (state) {
      case HomeState.initial:
        return _initial(cepController);

      case HomeState.loading:
        return _loading();

      case HomeState.success:
        return _success(cepController);

      case HomeState.error:
        return _error(cepController);

      default:
        return _error(cepController);
    }
  }

  Column _initial(CepController cepController) {
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

  Widget _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _success(CepController cepController) {
    return Padding(
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
              cepController.state = HomeState.initial;
            },
            child: const Text('Search Again'),
          ),
        ],
      ),
    );
  }

  Widget _error(CepController cepController) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('An Error occurred'),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            cepController.state = HomeState.initial;
          },
          child: const Text('Try Again'),
        ),
      ],
    );
  }
}
