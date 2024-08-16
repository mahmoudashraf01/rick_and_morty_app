import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../buisness_logic/cubit/characters_cubit.dart';
import '../constants/strings.dart';
import '../../data/models/charecters.dart';
import '../../data/repo/characters_repo_impl.dart';
import '../../data/services/character_services.dart';
import '../../presentaion/screens/characters_screen.dart';
import '../../presentaion/screens/charecters_details_screen.dart';

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
        final selectedChar = settings.arguments as AppCharacters;
        return MaterialPageRoute(
            builder: (_) => CharectersDetailsScreen(
                  character: selectedChar,
                ));
    }
    return null;
  }
}
