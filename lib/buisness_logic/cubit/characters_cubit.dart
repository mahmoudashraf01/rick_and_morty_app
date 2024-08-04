import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/data/models/charecters.dart';
import 'package:rick_and_morty_app/data/repo/characters_repo_impl.dart';
part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit(this.charactersRepo) : super(CharactersInitial());

  final CharactersRepo charactersRepo;
   List<AppCharacters> characters = [];
   
  List<AppCharacters> getAllCharacters() {
    emit(CharactersLoading());

    charactersRepo.getAllCharacters().then(
      (chracters) {
        emit(CharactersSuccess(chracters));
        characters = characters;
      },
    );
    return characters;
  }

  // Future<void> getAllCharacters() async {
  //   emit(CharactersLoading());

  //   var charactersResult = await charactersRepo.getAllCharacters();

  //   charactersResult.fold(
  //     (failure) => emit(
  //       CharactersFailure(failure.errorMessage),
  //     ),
  //     (characters) => emit(
  //       CharactersSuccess(
  //         characters.cast<AppCharacters>(),
  //       ),
  //     ),
  //   );
  // }
}
