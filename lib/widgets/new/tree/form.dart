import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  TextEditingController dateinput = TextEditingController();
  //text editing controller for text field

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

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
                        hintText: 'Insira uma descrição'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Escreva';
                      }
                      return null;
                    },
                  ),
                  TextField(
                      controller:
                          dateinput, //editing controller of this TextField
                      decoration: const InputDecoration(
                          icon: Icon(Icons.calendar_today), //icon of text field
                          labelText:
                              "Insira a data do plantio" //label text of field
                          ),
                      readOnly:
                          true, //set it true, so that user will not able to edit text
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(
                                2000), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime.now());

                        if (pickedDate != null) {
                          //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          setState(() {
                            dateinput.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {}
                      }),
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
