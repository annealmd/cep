import 'package:flutter/material.dart';

class LoadingCep extends StatelessWidget {
  const LoadingCep({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
