import 'package:flutter/material.dart';

class TreeCard extends StatefulWidget {
  const TreeCard({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<TreeCard> createState() => _TreeCardState();
}

class _TreeCardState extends State<TreeCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.yard_outlined),
              title: Text('Árvore id: x'),
              subtitle: Text('Descrição para a árvore'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('Ver'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('Editar'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
