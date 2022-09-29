import 'package:flutter/material.dart';
import 'package:plantree/routes.dart';

class PlanTree extends StatelessWidget {
  const PlanTree({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PlanTree',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      onGenerateTitle: (context) => "PlanTree",
      initialRoute: RouteGenerator.homePage,
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
