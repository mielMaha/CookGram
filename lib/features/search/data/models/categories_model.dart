import 'package:cookgram/features/search/domain/entities/categories_entity.dart';


class CategoriesModel extends CategoriesEntity {
   CategoriesModel({
    required String id,
    required String name,
    required String thumbnail,
  }) : super(
          
          name: name,
          imageUrl: thumbnail,
        );

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      id: json['idCategory'] as String,
      name: json["strCategory"] as String,
      thumbnail: json["strCategoryThumb"] as String,
    );
  }


  
}
