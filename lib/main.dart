import 'package:cep/Controller/cep_controller.dart';
import 'package:cep/core/app_router.dart';
import 'package:cep/core/app_theme.dart';
import 'package:cep/core/constants.dart';

import 'package:cep/service/cep_service.dart';
import 'package:cep/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => http.Client()),
        Provider(create: (context) => CepService(context.read())),
        ChangeNotifierProvider(
            create: (context) => CepController(context.read())),
      ],
      child: MaterialApp(
        title: Strings.appTitle,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        initialRoute: AppRouter.home,
        onGenerateRoute: AppRouter.onGenerateRoute,
        //home: const HomePage(),
      ),
    );
  }
}
