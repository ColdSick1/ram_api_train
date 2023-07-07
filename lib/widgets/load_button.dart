import 'package:flutter/material.dart';

class LoadButton extends StatelessWidget {
  final Function() function;
  const LoadButton({super.key, required this.function});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: function,
        child: const Text('Загрузить персонажей'),
      ),
    );
  }
}
