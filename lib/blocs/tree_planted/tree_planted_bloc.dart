import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:plantree/models/tree_planted.dart';

import '../../services/tree_planted_service.dart';
part 'tree_planted_event.dart';
part 'tree_planted_state.dart';

class TreePlantedBloc extends Bloc<TreePlantedEvent, TreePlantedState> {
  final TreePlantedService service;
  @override
  TreePlantedState get initialState => LoadingState();
  TreePlantedBloc(this.service) : super(LoadingState()) {
    on<LoadingSucessTreePlantedEvent>((event, emit) async {
      var trees = (await this.service.getAll());
      emit(LoadedSucessState(trees));
    });

    on<CreateTreePlantedEvent>((event, emit) async {
      if (state is LoadedSucessState) {
        var newTree = (await this.service.create(event.treePlanted));
        List<TreePlanted> updatedTrees;
        if (newTree != null) {
          updatedTrees = List.from((state as LoadedSucessState).tree)
            ..add(newTree);

          emit(LoadedSucessState(updatedTrees.reversed.toList()));
        }
      }
    });

    on<UpdateTreePlantedEvent>((event, emit) async {
      if (state is LoadedSucessState) {
        var treeupdated = (await this.service.update(event.treePlanted));
        if (treeupdated != null) {
          var trees = (await this.service.getAll());

          emit(LoadedSucessState(trees));
        }
      }
    });

    on<DeleteTreePlantedEvent>((event, emit) async {
      if (state is LoadedSucessState) {
        print('id= para excluir ' + event.treePlanted.id.toString());
        var deleted = (await this.service.delete(event.treePlanted.id));
        print(deleted);
        final treesupdated = (state as LoadedSucessState)
            .tree
            .where((tree) => tree.id != event.treePlanted.id)
            .toList();

        print('exluir');
        print(treesupdated);
        emit(LoadedSucessState(treesupdated));
      }
    });
  }
}
