import 'package:cookgram/core/network/api_service/api_service.dart';
import 'package:cookgram/core/network/dio_service.dart';
import 'package:cookgram/core/theme/app_theme.dart';
import 'package:cookgram/features/auth/persentaiton/views/splash_view.dart';
import 'package:cookgram/features/search/data/datasources/recipe_remote_data_source.dart';
import 'package:cookgram/features/search/data/repositories/recipe_repository_impl.dart';
import 'package:cookgram/features/search/persentation/cubits/meal_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final dioService = DioService();
  final apiService = ApiService(dioService);
  final remoteDataSource = RecipeRemoteDataSourceImpl(apiService: apiService);
  final repository = RecipeRepositoryImpl(remoteDataSource: remoteDataSource);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
           
            final cubit = SearchMealsCubit(repository)..searchCategories();
           
            return cubit;
          },
        ),
      ],
      child: const CookGram(),
    ),
  );
}

class CookGram extends StatelessWidget {
  const CookGram({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: const SplashView(),
    );
  }
}
