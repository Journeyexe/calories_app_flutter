import 'package:calories_app_flutter/screens/home_screen.dart';
import 'package:calories_app_flutter/screens/list_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String home = '/';
  static const String list = '/list';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
      return MaterialPageRoute(builder: (_) => const HomeScreen());
      case list:
        return MaterialPageRoute(builder: (_) {
          final args = settings.arguments as String;
          return ListScreen(keyWord: args,);
        });
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'Rota nao definida: ${settings.name}',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
    }
  }
}
