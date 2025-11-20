
# CookGram

A Flutter app for searching, adding, and sharing recipes with Clean Architecture and Supabase integration.


## Screenshots

![App Screenshot](https://github.com/mielMaha/CookGram/blob/main/assets/Purple%20Pink%20Gradient%20Mobile%20Application%20Presentation.png?raw=true)


## Table of Contents

 - About
 - Features
 - Architecture
 - Usage
 - Technologies

## About

CookGram is a Flutter application that allows users to explore recipes, add new ones, and share them with the community. Users can search for recipes by category or by specific ingredients, view detailed recipe information, and contribute their own recipes to the platform.

The app uses Supabase as a backend for storing recipes and images, and follows Clean Architecture principles for scalable and maintainable code.


## Features

#### Search by Food Category
![App Screenshot](https://github.com/mielMaha/CookGram/blob/main/assets/Screenshot_20251120_044905.png?raw=true)
- Users can select a food category (e.g., Pasta, Desserts, Salads).

- The app displays all recipes related to the selected category.

- Users can view the full details of each recipe, including ingredients, steps, and images.

#### Search by Ingredient or Recipe Name
![App Screenshot](https://github.com/mielMaha/CookGram/blob/main/assets/Screenshot_20251120_044944.png?raw=true)
- Users can search for recipes using a specific ingredient or by typing the recipe name.

- Results display all matching recipes with details.

#### Add New Recipe
![App Screenshot](https://github.com/mielMaha/CookGram/blob/main/assets/Screenshot_20251120_045455.png?raw=true)
- Users can create and add new recipes directly in the app.

- Each recipe includes title, ingredients, steps, and an image.

- New recipes are shared with all users in the community.

#### Community Recipes
![App Screenshot](https://github.com/mielMaha/CookGram/blob/main/assets/Screen_recording_20251120_045735.gif?raw=true)
- Displays all recipes added by users in the app.

- Users can explore new recipes contributed by the community


## Architecture
- Presentation Layer

   - Flutter Widgets & Views (lib/features/.../presentation/views)
   - State management using Cubit/BLoC (if applicable)
- Domain Layer

  - Entities (lib/features/.../domain/entities)
  - UseCases (lib/features/.../domain/usecase)
  - Repositories Interfaces (lib/features/.../domain/repositories)
- Data Layer

  - Repository Implementations (lib/features/.../data/repositories)
  - Remote DataSources (lib/features/.../data/datasources)
  - Models (lib/features/.../data/models)
## Usage


- View Recipe Details: Tap on any recipe to see ingredients, preparation steps, and images.
- Add Recipes: Tap "Add Recipe", fill in the details and upload an image.
- Search Recipes: Use the search feature to find recipes by category, ingredient, or name.
- Browse Recipes: Navigate to the Community screen to see all shared recipes.


## Tech Stack

**Client:** Dart, Flutter

**Server:** Supabase, Dio,Bloc/Cubit


## API

- [Recipe API](https://www.themealdb.com/api.php)

