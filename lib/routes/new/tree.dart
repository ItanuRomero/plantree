import 'package:flutter/material.dart';
import 'package:plantree/widgets/new/tree/form.dart';

class NewTreePage extends StatelessWidget {
  const NewTreePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Inserir nova árvore'),
      ),
      body: const NewTreeForm(),
    );
  }
}
