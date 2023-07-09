import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cubit/is_favorite_cubit.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  final cubit = IsFavoriteCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IsFavoriteCubit, bool>(
      bloc: cubit,
      builder: (context, state) {
        return Align(
          alignment: Alignment.bottomRight,
          child: IconButton.filled(
            onPressed: () {
              state ? cubit.tapLike(false) : cubit.tapLike(true);
            },
            icon: state
                ? const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : const Icon(Icons.favorite_border),
          ),
        );
      },
    );
  }
}
