import 'package:bloc/bloc.dart';
import 'package:calories_app_flutter/data/bloc/comida_event.dart';
import 'package:calories_app_flutter/data/bloc/comida_state.dart';
import 'package:calories_app_flutter/data/http/http_client.dart';
import 'package:calories_app_flutter/data/models/comida_model.dart';
import 'package:calories_app_flutter/data/repositories/comida_repository.dart';

class ComidaBloc extends Bloc<ComidaEvent, ComidaState> {
  final _repository = ComidaRepository(client: HttpClient());

  ComidaBloc() : super(ComidaInitialState()) {
    on(_mapEventToState);
  }

  void _mapEventToState(ComidaEvent event, Emitter emit) async {
    List<ComidaModel> lista = [];

    try {
      emit(ComidaLoadingState());
      if (event is GetComida) {
        lista = await _repository.getComida(event.keyWord);
      }
      emit(ComidaLoadedState(lista: lista));

    } catch (e) {
      emit(ComidaErrorState(exception: Exception(e)));
    }
  }
}
