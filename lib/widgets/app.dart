import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:plantree/routes.dart';
import 'package:plantree/routes/login/login.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:plantree/routes/start.dart';

import '../blocs/auth/auth_bloc.dart';

class PlanTree extends StatelessWidget {
  const PlanTree({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AuthBloc(),
        child: MaterialApp(
          title: 'PlanTree',
          theme: ThemeData(
              primarySwatch: Colors.green,
              appBarTheme: const AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.green,
                  statusBarIconBrightness: Brightness.dark,
                  statusBarBrightness: Brightness.light,
                ),
              )),
          onGenerateTitle: (context) => "PlanTree",
          initialRoute: RouteGenerator.startPage,
          onGenerateRoute: RouteGenerator.generateRoute,
          debugShowCheckedModeBanner: false,
          home: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthLoadingState) {
                return const Start(
                  title: '',
                );
              } else {
                return Login(
                  title: 'Login',
                );
              }
            },
          ),
          localizationsDelegates: const [
            FormBuilderLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('pt', 'BR'),
          ],
        ));
  }
}
