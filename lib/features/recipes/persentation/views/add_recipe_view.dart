import 'dart:developer';

import 'package:cookgram/features/recipes/domain/entities/recipe_entity.dart';
import 'package:cookgram/features/recipes/persentation/cubit/recipe_cubit.dart';
import 'package:cookgram/features/recipes/persentation/widgets/Image_recipe_part.dart';
import 'package:cookgram/features/recipes/persentation/widgets/coustm_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({super.key});

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  String selectedDifficulty = 'Easy';
  String name = 'Recipe name';
  TextEditingController stepsController = TextEditingController();
    TextEditingController ingredientsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          'Add Recipe',
          style: TextStyle(
            color: Color(0xFF3E2753),
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Name of the Dish *',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 5),
            TextField(
              decoration: InputDecoration(
               // helperStyle: TextStyle(fontSize: 16, color: Colors.black),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: name,
              ),
              onSubmitted: (value) => setState(() => name = value),
            ),

            ImageRecipePart(),

            const SizedBox(height: 25),

            const SizedBox(height: 25),

            const Text(
              'Difficulty *',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                difficultyButton('Easy', Colors.green),
                const SizedBox(width: 10),
                difficultyButton('Medium', Colors.amber),
                const SizedBox(width: 10),
                difficultyButton('Hard', Colors.red),
              ],
            ),

            const SizedBox(height: 30),
            const Text(
              'ingredients *',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: ingredientsController,
              onSubmitted: (value) {
                setState(() {
                  ingredientsController.text = value;
                });
              },
            ),
            const SizedBox(height: 30),
            const Text(
              'Steps *',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: stepsController,
              onSubmitted: (value) {
                setState(() {
                 stepsController.text  = value;
                });
              },
            ),
            SizedBox(height: 20,),
            Center(
              child: _addButtom(name: name, ingredientsController: ingredientsController, stepsController: stepsController),
            ),
          ],
        ),
      ),
    );
  }

  Widget difficultyButton(String text, Color color) {
    final isSelected = selectedDifficulty == text;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDifficulty = text;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? color : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: color),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _addButtom extends StatelessWidget {
  const _addButtom({
    super.key,
    required this.name,
    required this.ingredientsController,
    required this.stepsController,
  });

  final String name;
  final TextEditingController ingredientsController;
  final TextEditingController stepsController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green.shade900,
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: () {
        var image = context.read<RecipeCubit>().imageUrl!;
        context.read<RecipeCubit>().addRecipe(
          RecipeEntity(
            title: name,
            imageUrl: image,
            ingredients: ingredientsController.text,
            steps: stepsController.text,
          ),
        );
        log('recipe added');
      },
      child: const Text(
        'add recipe',
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
