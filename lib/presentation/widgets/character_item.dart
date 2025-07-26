import 'package:film_character/constants/mycolors.dart';
import 'package:film_character/data/models/character.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CharacterItem extends StatelessWidget {
  final Character character;
  const CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: ,
      padding: EdgeInsets.all(4),
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      decoration: BoxDecoration(
        color: Mycolors.mypinky,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          Get.toNamed( '/charaterdetails',arguments:character );
        },
        child: GridTile(
          footer: Container(
            width: double.infinity,
            padding: EdgeInsets.all(4),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              character.name,
              style: TextStyle(
                height: 1.3,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Mycolors.mywhite,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
          child: Hero(
            tag: character.charid,
            child: Container(
              color: Mycolors.mydarkgray,
              width: double.infinity,
              height: double.infinity,
              child:
                  character.img.isNotEmpty
                      ? FadeInImage.assetNetwork(
                        placeholder: 'images/loading.gif',
                        image: character.img,
                        fit: BoxFit.cover,
                      )
                      : Image.asset('images/progress_indicator.jpg'),
            ),
          ),
        ),
      ),
    );
  }
}
