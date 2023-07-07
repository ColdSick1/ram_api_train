import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ram_api/main_screen.dart';

import 'bloc/character_view_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // themeMode: ThemeMode.dark,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<CharacterViewBloc>(
            create: (context) => CharacterViewBloc(),
          ),
        ],
        child: const MainScreen(),
      ),
    );
  }
}
