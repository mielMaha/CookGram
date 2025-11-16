# CookGram



## Screenshots

![App Screenshot](https://github.com/mielMaha/CookGram/blob/main/assets/Purple%20Pink%20Gradient%20Mobile%20Application%20Presentation.png?raw=true)



> A Flutter app for searching and adding recipes with Clean Architecture and API integration.

## Table of Contents
- [About](#about)
- [Architecture](#architecture)
- [Features](#features)
- [API](#api)
- [Technologies](#technologies)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## About
CookGram is a Flutter application designed using **Clean Architecture** principles.  
It allows users to search for recipes, explore categories and ingredients, and add new recipes.  
The app fetches data from external APIs dynamically and provides a responsive, modular, and maintainable codebase.

## Architecture
The project follows **Clean Architecture** with three main layers:

- **Presentation Layer**  
  - Flutter Widgets & Views (`lib/features/.../presentation/views`)  
  - State management using Cubit/BLoC (if applicable)  

- **Domain Layer**  
  - Entities (`lib/features/.../domain/entities`)  
  - UseCases (`lib/features/.../domain/usecase`)  
  - Repositories Interfaces (`lib/features/.../domain/repositories`)  

- **Data Layer**  
  - Repository Implementations (`lib/features/.../data/repositories`)  
  - Remote DataSources (`lib/features/.../data/datasources`)  
  - Models (`lib/features/.../data/models`)  

This separation ensures:  
- Testable and maintainable code  
- Easy swapping of API or database  
- Clear dependency management  

## Features
- Search meals by name, category, ingredient, or area  
- Fetch meal details from API  
- Add recipes (recipes_maker feature)  
- Splash screen for initialization  
- Clean and modular codebase  

## API
The app uses a remote **Recipe API**:  
- Network requests are handled via **Dio** (`lib/core/network/dio_service.dart`)  
- Endpoints are centralized in `lib/core/network/endpoints/api_endpoints.dart`  
- API responses are converted into **Models**  
- Domain layer interacts with **Repositories** via UseCases  

**Example UseCases:**  
- `GetAllMealCategories`  
- `GetMealByName`  
- `GetMealDetailsById`  

## Technologies
- **Flutter**: UI toolkit for building natively compiled apps  
- **Dart**: Programming language  
- **Dio**: HTTP client for API requests  
- **Cubit/BLoC**: State management  
- **Clean Architecture**: Project structure for maintainability  
- **JSON Serialization**: Model conversion from API responses  

## Usage
Instructions for running the app and navigating features go here.

## Contributing
Guidelines for contributing to the project.

## License
License details.
