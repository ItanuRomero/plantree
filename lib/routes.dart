import 'package:flutter/material.dart';
import 'package:plantree/routes/home_page.dart';
import 'package:plantree/routes/login/login.dart';
import 'package:plantree/routes/new/tree.dart';
import 'package:plantree/routes/register/register.dart';
import 'package:plantree/routes/start.dart';

class RouteGenerator {
  static const String homePage = '/';
  static const String loginPage = '/login';
  static const String registerPage = '/register';
  static const String startPage = '/start';
  static const String randomPage = "/new/tree";
  RouteGenerator._();
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (_) => const MyHomePage(
            title: 'Home',
          ),
        );
      case loginPage:
        return MaterialPageRoute(
          builder: (_) => Login(
            title: 'Login',
          ),
        );
      case registerPage:
        return MaterialPageRoute(
          builder: (_) => Register(
            title: 'Cadastre-se',
          ),
        );
      case startPage:
        return MaterialPageRoute(
          builder: (_) => const Start(
            title: '',
          ),
        );
      case randomPage:
        return MaterialPageRoute(
          builder: (_) => const NewTreePage(),
        );
      default:
        throw const FormatException("Rota não encontrada");
    }
  }
}
