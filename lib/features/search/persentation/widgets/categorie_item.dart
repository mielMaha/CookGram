

import 'package:cookgram/features/search/persentation/cubits/meal_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CuisinesCostumItem extends StatelessWidget {
  const CuisinesCostumItem({super.key, required this.cuisine});

  final Map<String, String> cuisine;

  @override
  Widget build(BuildContext context) {
    final imageUrl = cuisine['thumbnail'] ?? '';
    final name = cuisine['name'] ?? 'No name';

    return GestureDetector(
      onTap: () {
        context.read<SearchMealsCubit>().searchByCategory(name);
      },
      child: Container(
        width: 106,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: const Offset(2, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(imageUrl, fit: BoxFit.cover, width: 60),
            Text(
              name,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
