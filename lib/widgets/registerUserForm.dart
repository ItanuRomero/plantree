import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../routes.dart';
import 'formField.dart';

class RegisterUserForm extends StatefulWidget {
  const RegisterUserForm({super.key});

  @override
  RegisterUserFormState createState() {
    return RegisterUserFormState();
  }
}

class RegisterUserFormState extends State<RegisterUserForm> {
  final _formKey = GlobalKey<FormState>();
  final controllerName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPhoneNumber = TextEditingController();
  final controllerPassword = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    controllerName.dispose();
    controllerEmail.dispose();
    controllerPassword.dispose();
    controllerPhoneNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TheFormField(
            label: "Nome",
            hint: "Digite seu nome aqui",
            password: false,
            controller: controllerName,
          ),
          TheFormField(
            label: "E-mail",
            hint: "Digite seu e-mail aqui",
            password: false,
            controller: controllerEmail,
          ),
          TheFormField(
            label: "Senha",
            hint: "Digite sua senha aqui",
            password: true,
            controller: controllerPassword,
          ),
          Center(
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.all(20.0),
                      textStyle: const TextStyle(fontSize: 20),
                      shape: const StadiumBorder()),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Criando seu usuário')),
                      );

                      Future.delayed(const Duration(milliseconds: 2000), () {
                        setState(() {
                          Navigator.of(context)
                              .pushNamed(RouteGenerator.loginPage);
                        });
                      });
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text('Cadastrar',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
