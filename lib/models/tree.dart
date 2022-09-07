import 'dart:collection';

class Tree {
  final int id;
  final String name;
  const Tree(this.id, this.name);
}

class TreeCache {
  var _index = -1;
  final List<Tree> _trees = [
    const Tree(1, "Jabuticabeira"),
    const Tree(2, "Mangueira"),
    const Tree(3, "Limoeiro")
  ];
  void addItem(int id, String name) {
    _trees.add(Tree(id, name));
  }

  int get index => _index;

  set index(int value) {
    if ((value >= 0) && (value < _trees.length)) {
      _index = value;
    } else {
      _index = -1;
    }
  }

  UnmodifiableListView<Tree> get list => UnmodifiableListView<Tree>(_trees);
}
