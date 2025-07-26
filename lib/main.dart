// ignore_for_file: must_be_immutable

import 'package:film_character/data/models/character.dart';
import 'package:film_character/data/repository/character_repository.dart';
import 'package:film_character/data/web_services/charaters_webservices.dart';
import 'package:film_character/logic/cubit/characters_cubit.dart';
import 'package:film_character/presentation/screens/character_screen.dart';
import 'package:film_character/presentation/screens/charater_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  late CharacterRepository characterRepository;
  late CharactersCubit charactersCubit;

   MyApp({super.key}) {
    characterRepository = CharacterRepository(
      charactersWebservice: CharactersWebservice(),
    );
    charactersCubit = CharactersCubit(characterRepository);
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => BlocProvider(
          create: (context) =>charactersCubit,
          
        child: CharacterScreen()
        )
        ),

        GetPage(name: '/charaterdetails', page: () => CharaterDetails(character:Get.arguments ,)),
      ],
    );
  }
}
