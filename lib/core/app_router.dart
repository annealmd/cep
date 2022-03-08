import 'package:cep/view/home_page.dart';
import 'package:flutter/material.dart';

import 'exceptions.dart';

class AppRouter {
  static const String home = '/';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}
