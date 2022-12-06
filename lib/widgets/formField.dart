import 'package:flutter/material.dart';

class TheFormField extends StatelessWidget {
  const TheFormField({
    Key? key,
    required this.hint,
    required this.password,
    required this.label,
    required this.controller,
  }) : super(key: key);

  final String label;
  final String hint;
  final bool password;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            contentPadding: const EdgeInsets.symmetric(horizontal: 10)),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Favor inserir todos os dados';
          }
          return null;
        },
        obscureText: password,
      ),
    );
  }
}
