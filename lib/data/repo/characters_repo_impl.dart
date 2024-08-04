import 'package:rick_and_morty_app/data/models/charecters.dart';
import 'package:rick_and_morty_app/data/services/character_services.dart';

class CharactersRepo  {
  CharactersRepo(this.characterServices);

 final CharacterServices characterServices;

  Future<List<AppCharacters>> getAllCharacters() async {
    final characters = await characterServices.getAllCharacters();

    return characters
        .map((character) => AppCharacters.fromJson(character))
        .toList();
  }
}


