import 'package:calories_app_flutter/data/models/comida_model.dart';

abstract class ComidaState {
  final List<ComidaModel> lista;

  ComidaState({required this.lista});
}

class ComidaInitialState extends ComidaState{
  ComidaInitialState() : super(lista: []);
}
class ComidaLoadingState extends ComidaState{
  ComidaLoadingState() : super(lista: []);
}
class ComidaLoadedState extends ComidaState{
  ComidaLoadedState({required super.lista});
}
class ComidaErrorState extends ComidaState{
  final Exception exception;
  ComidaErrorState({required this.exception}) : super(lista: []);
}