import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ram_api/widgets/like_button.dart';

import '../bloc/cubit/is_favorite_cubit.dart';

class CharacterCard extends StatefulWidget {
  final String name;
  final String image;
  final String status;
  final String type;
  final Map lastKnownLocation;
  const CharacterCard({
    super.key,
    required this.name,
    required this.image,
    required this.status,
    required this.type,
    required this.lastKnownLocation,
  });

  @override
  State<CharacterCard> createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {
  // @override
  // void initState() {
  //   final cubit = IsFavoriteCubit();
  //   cubit.likeInit();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(widget.image),
                Text(widget.name),
                Row(
                  children: [
                    Text(widget.status),
                    Text(widget.type),
                  ],
                ),
                Text(
                  widget.lastKnownLocation['name'],
                ),
                BlocProvider<IsFavoriteCubit>(
                  create: (context) => IsFavoriteCubit(),
                  child: const LikeButton(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
