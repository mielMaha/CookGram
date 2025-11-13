import 'package:cookgram/features/search/persentation/widgets/catgories_grid.dart';
import 'package:cookgram/features/search/persentation/widgets/top_card.dart';
import 'package:flutter/material.dart';

class Homebody extends StatelessWidget {
  const Homebody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TopCard(),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            'What’s on your Mind?',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child:  CatgoriesGrid(),
        ),
      ],
    );
  }
}
