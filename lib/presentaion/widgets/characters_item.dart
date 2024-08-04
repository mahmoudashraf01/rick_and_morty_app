import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/constants/colors.dart';
import 'package:rick_and_morty_app/core/constants/text.dart';
import 'package:rick_and_morty_app/data/models/charecters.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({super.key, required this.character});

  final AppCharacters character;
  @override
  Widget build(BuildContext context) {
    print(character.name);
    print(character.image);
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(
        footer: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: StylesColors.black,
          alignment: Alignment.bottomCenter,
          child: Text(
            character.name,
            style: title1Bold.copyWith(color: AppColors.white),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        child: Container(
          color: AppColors.grey,
          child: character.image.isNotEmpty
              ? FadeInImage.assetNetwork(
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: 'assets/images/Animation-Loading.gif',
                  image: character.image,
                )
              : const Icon(
                  Icons.warning,
                  size: 30,
                ),
        ),
      ),
    );
  }
}
