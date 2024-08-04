part of 'characters_cubit.dart';

@immutable
sealed class CharactersState {}

final class CharactersInitial extends CharactersState {}

final class CharactersLoading extends CharactersState {}

final class CharactersFailure extends CharactersState {
  final String errorMessage;

  CharactersFailure( this.errorMessage);
}

final class CharactersSuccess extends CharactersState {
  final List<AppCharacters> characters;

  CharactersSuccess(this.characters);
}
