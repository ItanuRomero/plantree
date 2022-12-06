import 'package:flutter/material.dart';

import '../routes.dart';

class Start extends StatefulWidget {
  const Start({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: MyStatelessWidget());
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.greenAccent,
                Colors.green,
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.5, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.decal),
        ),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                'images/logo_plantree.png',
                height: MediaQuery.of(context).size.height / 3 - 20,
                color: Colors.black,
                fit: BoxFit.contain,
                alignment: Alignment.topCenter,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 0, bottom: 120),
                child: Text(
                  'PlanTree',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 36, color: Colors.black),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(45),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.only(
                            right: 40, left: 40, bottom: 20, top: 20),
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(RouteGenerator.loginPage);
                      },
                      child: const Text('LOGIN'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green.withOpacity(0),
                    padding: const EdgeInsets.all(20.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(RouteGenerator.registerPage);
                  },
                  child: const Text('Cadastre-se',
                      style: TextStyle(fontSize: 18, color: Colors.black)),
                ),
              )
            ],
          )
        ]));
  }
}
