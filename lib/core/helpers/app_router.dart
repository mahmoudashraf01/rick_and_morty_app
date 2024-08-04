import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/buisness_logic/cubit/characters_cubit.dart';
import 'package:rick_and_morty_app/core/constants/strings.dart';
import 'package:rick_and_morty_app/data/repo/characters_repo_impl.dart';
import 'package:rick_and_morty_app/data/services/character_services.dart';
import 'package:rick_and_morty_app/presentaion/screens/characters_screen.dart';
import 'package:rick_and_morty_app/presentaion/screens/charecters_details_screen.dart';

class AppRouter {
  late CharactersRepo charactersRepoImpl;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepoImpl = CharactersRepo(CharacterServices());
    charactersCubit = CharactersCubit(charactersRepoImpl);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charectersRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => charactersCubit,
            child: const CharactersScreen(),
          ),
        );
      case charectersDetails:
        return MaterialPageRoute(
            builder: (_) => const CharectersDetailsScreen());
    }
    return null;
  }
}
