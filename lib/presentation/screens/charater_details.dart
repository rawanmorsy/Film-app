import 'package:film_character/constants/mycolors.dart';
import 'package:film_character/data/models/character.dart';
import 'package:flutter/material.dart';

class CharaterDetails extends StatelessWidget {
  const CharaterDetails({super.key, required this.character});
  final Character character;
  Widget buildsliverappbar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: Mycolors.mypinky,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          character.name,
          style: TextStyle(
            color: Mycolors.mydarkgray,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.start,
        ),

        // centerTitle: true,
        background: Hero(
          tag: character.charid,
          child: Image.network(
            character.img,
            // width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterinfo(String title, String val) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: Mycolors.mywhite,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: val,
            style: TextStyle(
              color: Mycolors.mywhite,
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
          ),
        ],
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolors.mydarkgray,
      body: CustomScrollView(
        slivers: [
          buildsliverappbar(),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 14, 14, 800),
                child: Column(
                  spacing: 30,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    characterinfo('Name : ', character.name),
                    characterinfo('Status : ', character.status),
                    characterinfo('Gender : ', character.gender),
                    characterinfo('species : ', character.species!),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
