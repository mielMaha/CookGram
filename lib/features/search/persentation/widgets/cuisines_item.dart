import 'package:cookgram/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CuisinesCostumItem extends StatelessWidget {
  const CuisinesCostumItem({super.key, required this.cuisine});

  final Map<String, String> cuisine;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 106,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.whiteAppC,
        boxShadow: [
          BoxShadow(
            color: AppColors.brownAppC.withOpacity(0.4),
            spreadRadius: 1,

            blurRadius: 3,
            offset: Offset(2, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network(
            cuisine['image']!,
            fit: BoxFit.cover,
            width: 60,
            // height: 69,
          ),
          Text(
            cuisine['name']!,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
