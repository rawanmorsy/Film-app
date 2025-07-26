// ignore_for_file: camel_case_types
part of 'characters_cubit.dart';

@immutable
sealed class CharactersState {}
class CharactersInitial extends CharactersState{} 
class loadedcharacter extends CharactersState {
  final List<Character> characters;

  loadedcharacter({required this.characters});
  
}
