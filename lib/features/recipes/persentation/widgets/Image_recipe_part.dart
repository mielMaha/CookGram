import 'dart:developer';
import 'dart:io';

import 'package:cookgram/features/recipes/persentation/cubit/recipe_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImageRecipePart extends StatefulWidget {
  ImageRecipePart({super.key});

  @override
  State<ImageRecipePart> createState() => _ImageRecipePartState();
}

class _ImageRecipePartState extends State<ImageRecipePart> {
  bool isLoaded = false;

  Future<File?> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    File? imageFile = File(image!.path);
    return imageFile;
  }

File ?image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 4,
            offset: const Offset(2, 2),
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Add photo of the Dish *',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                child: isLoaded
                    ? Image.file(
                      image!,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                    : Image.asset(
                        'assets/homeTopImage.png',
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                  onPressed: () async{
               File? imageFile =    await pickImage();
               setState(() {
                 isLoaded = true;
                 image = imageFile;
               });
               
               context.read<RecipeCubit>().uploadImage(imageFile!);
               log('image uploaded');
                  },
                  icon: const Icon(Icons.camera_alt, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
