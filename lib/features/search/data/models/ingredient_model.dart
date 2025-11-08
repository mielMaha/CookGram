import 'package:cookgram/features/search/domain/entities/Ingredient_entite.dart';


class IngredientModel extends IngredientEntity {
   IngredientModel({
   
    required String name,
    required String img,
    
  }) : super(
          
          name: name,
    
        img: img
        );

  /// Factory method to create IngredientModel from JSON
  factory IngredientModel.fromJson(Map<String, dynamic> json) {
    return IngredientModel(
     
      name: json['strIngredient'] as String,
      img: json['strIngredientThumb'] as String
      
      
    );
  }

 
}
