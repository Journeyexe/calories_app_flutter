import 'package:calories_app_flutter/data/bloc/comida_bloc.dart';
import 'package:calories_app_flutter/data/bloc/comida_event.dart';
import 'package:calories_app_flutter/data/bloc/comida_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ComidaBloc _comidaBloc;

  @override
  void initState() {
    super.initState();
    _comidaBloc = ComidaBloc();
    _comidaBloc.add(GetComida());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ComidaBloc, ComidaState>(
        bloc: _comidaBloc,
        builder: (context, state) {
          if (state is ComidaLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ComidaErrorState) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.error),
                  Text(
                    state.exception.toString(),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            );
          }

          final list = state.lista;
          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            itemCount: list.length,
            itemBuilder: (context, index) {
              final item = list[index];
              return ListTile(
                leading: CircleAvatar(
                  child: Center(
                    child: Text('${index+1}'),
                  ),
                ),
                title: Text(item.nome),
                subtitle: Text(item.quantidade),
                trailing: Text(item.calorias),
              );
            },
          );
        },
      ),
    );
  }
}
