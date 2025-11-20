import 'dart:io';

import 'package:cookgram/features/recipes/data/models/recipe_model.dart';
import 'package:cookgram/features/recipes/domain/entities/recipe_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

 class SupabaseManager {
 static const projectUrl = 'https://wqnpapakcovjqydrpfyq.supabase.co';
  static const anonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndxbnBhcGFrY292anF5ZHJwZnlxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjM0OTE2NzYsImV4cCI6MjA3OTA2NzY3Nn0.wQTSXM-FZvqpMKvrtYWO-8CLOcudRU3IH3eGi01K9KM';

 static Future<void> initializeSupabase() async {
     await Supabase.initialize(
    url: projectUrl,
    anonKey: anonKey,
  );

  }
  
   final SupabaseClient client = Supabase.instance.client;

  Future<String> uploadImage(File image) async {
    final timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
    final uniquePath='$timeStamp-${image.path.split('/').last}';
    final response = await client.storage.from('images').upload(uniquePath, image);
    print(response);
    return uniquePath;
  }
  
  Future<String> downloadImage(String imageName) async {
    final response = await client.storage.from('images').getPublicUrl(imageName);
    return response;
  }

  Future<void> addRecipe(RecipeEntity recipe) async {
    await client.from('recipes').insert(recipe.toJson());
  }

Future<List<RecipeEntity>> getUsersRecipes() async {
  final response = await client.from('recipes').select();

  if (response == null) {
    return [];
  }

  return response.map((e) => RecipeModel.fromJson(e)).toList();
}


}