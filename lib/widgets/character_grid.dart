import 'package:flutter/material.dart';
import 'package:ram_api/widgets/character_card.dart';

import '../models/character_model.dart';

class CharacterGrid extends StatelessWidget {
  final List<CharacterModel> list;
  const CharacterGrid({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 40,
      childAspectRatio: 1 / 2,
      children: list
          .map(
            (e) => CharacterCard(
              name: e.name,
              image: e.image,
              status: e.status,
              type: e.type,
              lastKnownLocation: e.lastKnownLocation,
            ),
          )
          .toList(),
    );
  }
}
