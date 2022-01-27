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
    var widgetState = stateManagementa(state);
    return Card(
      margin: const EdgeInsets.all(20),
      elevation: 10,
      shadowColor: Colors.cyan,
      child: widgetState,
    );
  }

  Widget stateManagementa(CepState state) {
    if (state is InitialCepSate) return InitialCep();
    if (state is LoadingCepSate) return const LoadingCep();
    if (state is SuccessCepSate) return SuccessCep();
    if (state is ErrorCepSate) return ErrorCep();

    return InitialCep();
  }
}
