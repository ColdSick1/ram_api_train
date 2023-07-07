import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ram_api/bloc/character_view_bloc.dart';
// import 'package:ram_api/cubit/character_view_cubit.dart';
import 'package:ram_api/widgets/character_grid.dart';
import 'package:ram_api/widgets/error_dialog.dart';
import 'package:ram_api/widgets/load_button.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final characterCubit = CharacterViewBloc();
    // CharacterViewCubit();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick and Morty characters!'),
        actions: [
          IconButton(
            onPressed: () => context.read<CharacterViewBloc>().add(
                  CharacterViewInit(),
                ),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: BlocBuilder<CharacterViewBloc, CharacterViewState>(
        // bloc: characterCubit,
        builder: (context, state) {
          if (state is CharacterViewInitial) {
            return LoadButton(
              function: () => context.read<CharacterViewBloc>().add(
                    CharacterViewLoad(),
                  ),
            );
          } else if (state is CharacterViewLoaded) {
            return CharacterGrid(list: state.list);
          } else if (state is CharacterViewLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ErrorDialog(
              function: () => context.read<CharacterViewBloc>().add(
                    CharacterViewInit(),
                  ),
            );
          }
        },
      ),
    );
  }
}
