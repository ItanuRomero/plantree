import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantree/blocs/tree_planted/tree_planted_bloc.dart';
import 'package:plantree/models/tree_planted.dart';
import 'package:plantree/routes.dart';
import 'package:plantree/services/tree_planted_service.dart';
import 'package:plantree/widgets/home/home_drawer.dart';
import 'package:plantree/widgets/home/tree_card.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required String title});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          TreePlantedBloc(TreePlantedServiceImpl()),
      child: const TreePage(title: 'Minhas árvores'),
    );
  }
}

class TreePage extends StatefulWidget {
  const TreePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _TreePageState createState() => _TreePageState();
}

class _TreePageState extends State<TreePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TreePlantedBloc>(context)
        .add(LoadingSucessTreePlantedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: BlocListener<TreePlantedBloc, TreePlantedState>(
            listener: (context, state) {
              if (state is ErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                  ),
                );
              }
            },
            child: _blocBuilder(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          foregroundColor: Colors.green,
          elevation: 10,
          onPressed: () => _modalAdd(context: context),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        drawer: const HomeDrawer());
  }

  _blocBuilder() {
    return BlocBuilder<TreePlantedBloc, TreePlantedState>(
      builder: (context, state) {
        if (state is InitialState) {
          return const Center(
            child: Text("Initial"),
          );
        } else if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is LoadedSucessState) {
          return Column(
            children: <Widget>[
              Text("Total de Árvores plantadas:${state.tree.length}"),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.tree.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: UniqueKey(),
                      background: Container(
                        color: Colors.red,
                      ),
                      child: ListTile(
                        title: Text(
                            '${state.tree[index].id} - ${state.tree[index].name}'),
                        trailing: Wrap(
                          children: <Widget>[
                            IconButton(
                              icon: const Icon(
                                Icons.visibility,
                                color: Colors.orange,
                              ),
                              onPressed: () => _modalUpdate(
                                treeP: state.tree[index],
                                context: context,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onDismissed: (DismissDirection direction) {
                        BlocProvider.of<TreePlantedBloc>(context)
                            .add(DeleteTreePlantedEvent(state.tree[index]));

                        // Then show a snackbar.
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("excluíndo...")));
                      },
                    );
                  },
                ),
              ),
            ],
          );
        } else if (state is ErrorState) {
          return const Center(child: Text("Error"));
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                'sem dados :(',
              ),
            ],
          ),
        );
      },
    );
  }
}

_modalAdd({required BuildContext context}) {
  String _title = "";
  String _description = "";
  String _date = "";
  String _local = "";
  String _tree = "";
  showDialog(
      barrierDismissible: true,
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Adicionar'),
          content: Wrap(
            children: <Widget>[
              TextFormField(
                onChanged: (newTitle) => _title = newTitle,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nome',
                ),
              ),
              TextFormField(
                onChanged: (newTitle) => _description = newTitle,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Descrição',
                ),
              ),
              TextFormField(
                onChanged: (newTitle) => _local = newTitle,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Local',
                ),
              ),
              TextFormField(
                onChanged: (newTitle) => _date = newTitle,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Data do plantio',
                ),
              ),
              TextFormField(
                onChanged: (newTitle) => _tree = newTitle,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Tipo de árvore',
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                BlocProvider.of<TreePlantedBloc>(context).add(
                    CreateTreePlantedEvent(TreePlanted(
                        id: 0,
                        name: _title,
                        description: _description,
                        local: _local,
                        userId: 0,
                        date: _date,
                        tree: _tree)));

                Navigator.pop(context);
              },
              child: const Text('Adicionar'),
            ),
          ],
        );
      });
}

_modalUpdate({required TreePlanted treeP, required BuildContext context}) {
  var _name = treeP.name;
  var _description = treeP.description;
  var _date = treeP.date;
  var _local = treeP.local;
  var _tree = treeP.tree;

  showDialog(
      barrierDismissible: true,
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Árvore Plantada"),
          content: Wrap(
            children: <Widget>[
              TextFormField(
                initialValue: treeP.name,
                onChanged: (newTitle) => _name = newTitle,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nome',
                ),
              ),
              TextFormField(
                initialValue: treeP.description,
                onChanged: (newTitle) => _description = newTitle,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Descrição',
                ),
              ),
              TextFormField(
                initialValue: treeP.local,
                onChanged: (newTitle) => _local = newTitle,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Local',
                ),
              ),
              TextFormField(
                initialValue: treeP.date.toString(),
                onChanged: (newTitle) => _date = newTitle,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Data platio',
                ),
              ),
              TextFormField(
                initialValue: treeP.tree,
                onChanged: (newTitle) => _tree = newTitle,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Tipo Árvore',
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Fechar'),
            ),
            TextButton(
              onPressed: () {
                BlocProvider.of<TreePlantedBloc>(context)
                    .add(UpdateTreePlantedEvent(
                  TreePlanted(
                      name: _name,
                      id: treeP.id,
                      userId: treeP.userId,
                      description: _description,
                      date: _date,
                      local: _local,
                      tree: _tree),
                ));
                Navigator.pop(context);
              },
              child: const Text('Alterar'),
            ),
          ],
        );
      });
}
