import 'package:bloc/bloc.dart';
import 'package:film_character/data/models/character.dart';
import 'package:film_character/data/repository/character_repository.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharacterRepository character_repo;

 late List<Character> characters;
  CharactersCubit(this.character_repo) : super(CharactersInitial());

 Future< List<Character> >getallcharacter()async {
 final characters=  await character_repo.getallcharacters();
      this.characters = characters;
      emit(loadedcharacter(characters: characters));
   

    return characters;
  }
}
