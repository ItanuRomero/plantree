import 'package:flutter/material.dart';

// Define a custom Form widget.
class NewTreeForm extends StatefulWidget {
  const NewTreeForm({super.key});

  @override
  NewTreeFormState createState() {
    return NewTreeFormState();
  }
}

class NewTreeFormState extends State<NewTreeForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(50),
        child: Form(
            key: _formKey,
            child: Container(
              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Colors.green)),
              padding:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        icon: Icon(
                          Icons.yard,
                          color: Colors.green,
                        ),
                        hintText: 'Insira o nome'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Escreva';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      icon: Icon(Icons.telegram, color: Colors.green),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Escreva';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Plantando informações')),
                          );
                        }
                      },
                      child: const Text('Enviar'),
                    ),
                  ),
                ],
              ),
            )));
  }
}
