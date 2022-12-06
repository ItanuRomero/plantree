part of 'tree_planted_bloc.dart';

@immutable
abstract class TreePlantedState extends Equatable {
  const TreePlantedState();
}

//eventos que sairão do bloc

class EmptyState extends TreePlantedState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class InitialState extends TreePlantedState {
  const InitialState();
  @override
  List<Object> get props => [];
}

class LoadingState extends TreePlantedState {
  const LoadingState();
  @override
  List<Object> get props => [];
}

class LoadedSucessState extends TreePlantedState {
  final List<TreePlanted> tree;
  const LoadedSucessState(this.tree);
  @override
  List<Object> get props => [tree];
}

class ErrorState extends TreePlantedState {
  final String message;
  const ErrorState(this.message);
  @override
  List<Object> get props => [message];
}
