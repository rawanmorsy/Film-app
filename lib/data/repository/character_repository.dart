import 'package:film_character/data/models/character.dart';
import 'package:film_character/data/web_services/charaters_webservices.dart';

class CharacterRepository {
  final CharactersWebservice charactersWebservice;

  CharacterRepository({required this.charactersWebservice});
  Future<List<Character>> getallcharacters() async {
    final characters = await charactersWebservice.getcharacters();
    final result = characters['results'] as List;
    return result.map((character) => Character.fromJson(character)).toList();
  }
}
