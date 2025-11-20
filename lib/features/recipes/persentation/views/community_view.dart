import 'package:cookgram/features/recipes/persentation/cubit/recipe_cubit.dart';
import 'package:cookgram/features/recipes/persentation/cubit/recipe_states.dart';
import 'package:cookgram/features/recipes/persentation/widgets/user_recipe_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommunityView extends StatefulWidget {
  const CommunityView({super.key});

  @override
  State<CommunityView> createState() => _CommunityViewState();
}

class _CommunityViewState extends State<CommunityView> {
  void initState() {
    super.initState();
    context.read<RecipeCubit>().getAllRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RecipeCubit, RecipeStates>(
        builder: (context, state) {
          if (state is RecipeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RecipeLoaded) {
            return ListView.builder(
              itemCount: state.recipes.length,
              itemBuilder: (context, index) {
                final recipe = state.recipes[index];
                return UserRecipeItem(recipe: recipe);
              },
            );
          } else {
            return Center(child: Text('No recipes found'));
          }
        },
      ),
    );
  }
}

