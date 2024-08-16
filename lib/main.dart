import 'package:flutter/material.dart';
import 'core/constants/colors.dart';
import 'core/helpers/app_router.dart';

void main() {
  runApp(
    RickAndMortyApp(
      appRouter: AppRouter(),
    ),
  );
}

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key, required this.appRouter});

  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick & Morty',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.yellow,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.transparent,
          
        ),
      ),
    );
  }
}
