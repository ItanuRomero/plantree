import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantree/routes/login/login.dart';

import '../../blocs/auth/auth_bloc.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      return Drawer(
        child: ListView(
          children: (state is AuthAuthenticatedState)
              ? [
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Colors.green,
                    ),
                    child: Column(
                      children: [
                        Row(children: [
                          Text(
                            state.user.name,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 22),
                          )
                        ]),
                        Row(children: [
                          Text(
                            state.user.email,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                          )
                        ])
                      ],
                    ),
                  ),
                  ListTile(
                    title: const Text('Minhas árvores'),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: const Text('Sair'),
                    onTap: () {
                      context.read<AuthBloc>().add(AuthLogoutEvent());
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Login(
                                  title: '',
                                )),
                      );
                    },
                  ),
                ]
              : [
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Colors.green,
                    ),
                    child: Column(
                      children: [
                        Row(children: const [Text('Não autenticado')]),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Login(
                                        title: '',
                                      )),
                            );
                          },
                          splashRadius: 23,
                          icon: const Icon(
                            Icons.login,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
        ),
      );
    });
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
