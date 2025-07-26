
import 'package:flutter_offline/flutter_offline.dart';
import 'package:film_character/constants/mycolors.dart';
import 'package:film_character/data/models/character.dart';
import 'package:film_character/logic/cubit/characters_cubit.dart';
import 'package:film_character/presentation/widgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  List<Character> allcharacters = [];
  List<Character> searched_characters = [];
  TextEditingController controller = TextEditingController();
  bool searchicon = true;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getallcharacter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Mycolors.mypinky,
        title:
            searchicon
                ? Text(
                  'Rick and Morty👾',
                  style: TextStyle(color: Mycolors.mygary),
                )
                : TextField(
                  controller: controller,
                  autofocus: true,
                  cursorColor: Mycolors.mywhite,
                  style: TextStyle(color: Mycolors.mywhite, fontSize: 16),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search for character...',
                    hintStyle: TextStyle(color: Mycolors.mywhite, fontSize: 16),
                  ),
                  onChanged: (searchedName) {
                    setState(() {
                      searched_characters =
                          allcharacters
                              .where(
                                (character) => character.name
                                    .toLowerCase()
                                    .startsWith(searchedName.toLowerCase()),
                              )
                              .toList();
                    });
                  },
                ),
        actions: [
          IconButton(
            icon: Icon(searchicon ? Icons.search : Icons.close),
            color: Mycolors.mywhite,
            onPressed: () {
              setState(() {
                if (searchicon == false) {
                  controller.clear();
                  searched_characters.clear();
                }
                searchicon = !searchicon;
              });
            },
          ),
        ],
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          List<ConnectivityResult> connectivity,
          Widget child,
        ) {
          final bool connected =
              !connectivity.contains(ConnectivityResult.none);
          if (connected) {
            return BlocBuilder<CharactersCubit, CharactersState>(
              builder: (context, state) {
                if (state is loadedcharacter) {
                  allcharacters = state.characters;
                  return build_characterlist(
                    allcharacters: allcharacters,
                    searchedcharacter: searched_characters,
                    controller: controller,
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            );
          } else {
            return nointernet();
          }
        },
        child: Center(child: CircularProgressIndicator(),),
      //  builder: (context) => ,
      ),
    );
  }
}

Widget nointernet() {
  return Center(
    child: Column(
      children: [
        Image.asset('images/undraw_server-error_syuz.png'),
        Text(
          'can\'t connect...',
          style: TextStyle(color: Mycolors.mymidgray, fontSize: 20),
        ),
      ],
    ),
  );
}

class build_characterlist extends StatelessWidget {
  const build_characterlist({
    super.key,
    required this.allcharacters,
    required this.searchedcharacter,
    required this.controller,
  });

  final List<Character> allcharacters;
  final List<Character> searchedcharacter;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final charactersToShow =
        controller.text.isNotEmpty ? searchedcharacter : allcharacters;

    return Container(
      color: Mycolors.mygary,
      child: GridView.builder(
        padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: charactersToShow.length,
        itemBuilder: (context, index) {
          return CharacterItem(character: charactersToShow[index]);
        },
      ),
    );
  }
}
