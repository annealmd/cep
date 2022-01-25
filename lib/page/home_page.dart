import 'package:cep/Controller/cep_controller.dart';
import 'package:cep/page/widget/error_cep.dart';
import 'package:cep/page/widget/initial_cep.dart';
import 'package:cep/page/widget/loading_cep.dart';
import 'package:cep/page/widget/success_cep.dart';
import 'package:cep/service/cep_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
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
        child: AnimatedBuilder(
          animation: cepController.state,
          builder: (context, child) {
            return stateManagement(cepController.state.value);
          },
        ),
      ),
    );
  }

  Widget stateManagement(HomeState state) {
    switch (state) {
      case HomeState.initial:
        return InitialCep(cepController: cepController);

      case HomeState.loading:
        return const LoadingCep();

      case HomeState.success:
        return SuccessCep(cepController: cepController);

      case HomeState.error:
        return ErrorCep(cepController: cepController);

      default:
        return ErrorCep(cepController: cepController);
    }
  }
}
