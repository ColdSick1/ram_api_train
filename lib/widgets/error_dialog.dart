import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final Function() function;
  const ErrorDialog({super.key, required this.function});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        title: const Text('Что-то пошло не так...'),
        content: const Text('Повторите попытку позже'),
        actions: [
          TextButton(
            onPressed: function,
            child: const Text('Перезагрузить'),
          ),
        ],
      ),
    );
  }
}
