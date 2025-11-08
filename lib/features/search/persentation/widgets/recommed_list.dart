import 'package:cookgram/core/theme/app_colors.dart';
import 'package:cookgram/core/utils/tetList.dart';
import 'package:flutter/material.dart';

class RecommedList extends StatelessWidget {
  const RecommedList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.brownAppC, width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ClipOval(
                    child: Image.network(
                      cuisines[index]['image']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Text(
                cuisines[index]['name']!,
                style: TextStyle(
                  color: AppColors.blackAppC,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      },
      itemCount: cuisines.length,
    );
  }
}
