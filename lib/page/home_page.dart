import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import 'package:cep/Controller/cep_controller.dart';
import 'package:cep/page/widget/error_cep.dart';
import 'package:cep/page/widget/initial_cep.dart';
import 'package:cep/page/widget/loading_cep.dart';
import 'package:cep/page/widget/success_cep.dart';
import 'package:cep/states/cep_state.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CepController>().value;
    var widgetState = stateManagement(state);
    return Card(
      margin: const EdgeInsets.all(20),
      elevation: 10,
      shadowColor: Colors.cyan,
      child: widgetState,
    );
  }

  Widget stateManagement(Object state) {
    print(state);
    switch (state) {
      case InitialCepSate:
        return InitialCep();

      // return InitialCep(cepController: cepController);

      case LoadingCepSate:
        return const LoadingCep();

      case SuccessCepSate:
        return SuccessCep();

      case ErrorCepSate:
        return ErrorCep();

      default:
        return InitialCep();
    }
  }
}
