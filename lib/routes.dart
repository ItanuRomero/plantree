import 'package:flutter/material.dart';
import 'package:plantree/routes/home_page.dart';
import 'package:plantree/routes/new/tree.dart';

class RouteGenerator {
  static const String homePage = '/';
  static const String randomPage = "/random";
  RouteGenerator._() {}
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (_) => const MyHomePage(
            title: 'Home',
          ),
        );
      case randomPage:
        return MaterialPageRoute(
          builder: (_) => const RandomPage(),
        );
      default:
        throw const FormatException("Rota não encontrada");
    }
  }
}
