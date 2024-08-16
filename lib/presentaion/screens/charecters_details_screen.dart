import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/text.dart';
import '../../data/models/charecters.dart';

class CharectersDetailsScreen extends StatelessWidget {
  const CharectersDetailsScreen({
    super.key,
    required this.character,
  });
  final AppCharacters character;

  @override
  Widget build(BuildContext context) {
    String extractNumbers(List<dynamic> urls) {
      List<dynamic> numbers = urls.map((url) {
        final parts = url.split('/');
        return parts.last;
      }).toList();

      return numbers.join(' / ');
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.grey,
        body: CustomScrollView(
          slivers: [
            BuildSliverAppBar(
              character: character.name,
              tag: character.charId,
              img: character.image,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CharacterInfo(
                          title: 'Episodes: ',
                          value: extractNumbers(character.episode),
                        ),
                        const BuildDivider(
                          endIndent: 250,
                        ),
                        CharacterInfo(
                          title: 'Origin: ',
                          value: character.origin.name,
                        ),
                        const BuildDivider(
                          endIndent: 270,
                        ),
                        CharacterInfo(
                          title: 'Location: ',
                          value: character.location.name,
                        ),
                        const BuildDivider(
                          endIndent: 250,
                        ),
                        CharacterInfo(
                          title: 'Species: ',
                          value: character.species,
                        ),
                        const BuildDivider(
                          endIndent: 260,
                        ),
                        CharacterInfo(
                          title: 'Gender: ',
                          value: character.gender,
                        ),
                        const BuildDivider(
                          endIndent: 260,
                        ),
                        CharacterInfo(
                          title: 'Status: ',
                          value: character.status,
                        ),
                        const BuildDivider(
                          endIndent: 270,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 400,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BuildSliverAppBar extends StatelessWidget {
  const BuildSliverAppBar({
    super.key,
    required this.character,
    required this.tag,
    required this.img,
  });
  final String character;
  final Object tag;
  final String img;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 400,
      pinned: true,
      stretch: true,
      backgroundColor: AppColors.grey,
      flexibleSpace: FlexibleSpaceBar(
        // title: Text(
        //   character,
        //   style: title2Bold.copyWith(color: AppColors.yellow),
        // ),
        centerTitle: true,
        background: Hero(
          tag: tag,
          child: Image.network(
            img,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class CharacterInfo extends StatelessWidget {
  const CharacterInfo({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: title2Bold.copyWith(color: AppColors.white),
          ),
          TextSpan(
            text: value,
            style: title2Bold.copyWith(
              fontSize: 15,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class BuildDivider extends StatelessWidget {
  const BuildDivider({super.key, required this.endIndent});
  final double endIndent;
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AppColors.yellow,
      height: 20,
      endIndent: endIndent,
      thickness: 2,
    );
  }
}
