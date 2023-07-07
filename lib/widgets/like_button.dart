import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cubit/is_favorite_cubit.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  @override
  Widget build(BuildContext context) {
    bool isFavorite = true;
    // final cubit = IsFavoriteCubit();
    return BlocBuilder<IsFavoriteCubit, IsFavoriteState>(
      bloc: IsFavoriteCubit(),
      builder: (context, state) {
        if (state is IsFavoriteInitial) {
          return Align(
            alignment: Alignment.bottomRight,
            child: IconButton.filled(
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                icon: Icon(Icons.favorite,
                    color: isFavorite ? Colors.red : Colors.white)),
          );
        } else {
          return const Icon(Icons.delete_forever);
        }
      },
    );
  }
}
