import 'package:cookgram/core/theme/app_colors.dart';
import 'package:cookgram/features/search/persentation/cubits/meal_cubit.dart';
import 'package:cookgram/features/search/persentation/cubits/meal_states.dart';
import 'package:cookgram/features/search/persentation/widgets/meal_grid.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Searchview extends StatelessWidget {
  const Searchview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchPar(),
          Expanded(
            child: BlocBuilder<SearchMealsCubit, MealState>(
              builder: (context, state) {
                 if (state is MealLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is MealLoaded) {
                  return MealGrid(meals: state.meals,);
                } else {
                  return  Image.asset('assets/image.png');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSearchPar extends StatelessWidget {
  const CustomSearchPar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.arrow_back_ios),
        Container(
          width: 320,
          height: 50,

          child: TextField(
            onSubmitted: (value) {
              context.read<SearchMealsCubit>().searchByName(value);
            },
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: AppColors.greyAppC),
              hintText: 'Search Recipes / Ingredients ',
              hintStyle: TextStyle(color: AppColors.greyAppC.withOpacity(0.6)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Color(0xffEEECE7)),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Color(0xffEEECE7)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
