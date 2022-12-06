part of 'tree_planted_bloc.dart';

@immutable
abstract class TreePlantedEvent extends Equatable {
  const TreePlantedEvent();

  @override
  List<Object> get props => [];
}

//eventos que serão enviados para a entrada do bloc

class LoadingSucessTreePlantedEvent extends TreePlantedEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class GetTreePlantedEvent extends TreePlantedEvent {
  final int id;
  const GetTreePlantedEvent(this.id);
  @override
  List<Object> get props => [];
}

class CreateTreePlantedEvent extends TreePlantedEvent {
  final TreePlanted treePlanted;
  const CreateTreePlantedEvent(this.treePlanted);

  @override
  List<Object> get props => [treePlanted];
}

class UpdateTreePlantedEvent extends TreePlantedEvent {
  final TreePlanted treePlanted;
  const UpdateTreePlantedEvent(this.treePlanted);

  @override
  List<Object> get props => [treePlanted];
}

class DeleteTreePlantedEvent extends TreePlantedEvent {
  final TreePlanted treePlanted;

  const DeleteTreePlantedEvent(this.treePlanted);

  @override
  List<Object> get props => [treePlanted];
}

class NetworkErrorEvent extends Error {}
