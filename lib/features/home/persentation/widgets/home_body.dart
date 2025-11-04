import 'package:cookgram/core/theme/app_colors.dart';
import 'package:cookgram/core/utils/tetList.dart';
import 'package:cookgram/features/home/persentation/widgets/cuisines_grid.dart';
import 'package:cookgram/features/home/persentation/widgets/top_card.dart';

import 'package:flutter/material.dart';

class Homebody extends StatelessWidget {
  const Homebody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TopCard(),
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            'What’s on your Mind?',
            style: TextStyle(
              color: AppColors.blackAppC,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        Expanded(child: CuisinesGrid(cuisines: cuisines)),
      ],
    );
  }
}
