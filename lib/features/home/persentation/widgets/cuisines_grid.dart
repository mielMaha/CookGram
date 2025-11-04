import 'package:cookgram/features/home/persentation/widgets/cuisines_item.dart';
import 'package:flutter/material.dart';

class CuisinesGrid extends StatelessWidget {
  const CuisinesGrid({super.key, required this.cuisines});

  final List<Map<String, String>> cuisines;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        childAspectRatio: 0.85,
        mainAxisSpacing: 16,
      ),
      itemCount: cuisines.length,
      itemBuilder: (context, index) {
        final cuisine = cuisines[index];
        return CuisinesCostumItem(cuisine: cuisine);
      },
    );
  }
}
