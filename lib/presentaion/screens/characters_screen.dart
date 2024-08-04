import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/buisness_logic/cubit/characters_cubit.dart';
import 'package:rick_and_morty_app/core/constants/colors.dart';
import 'package:rick_and_morty_app/core/constants/text.dart';
import 'package:rick_and_morty_app/data/models/charecters.dart';
import 'package:rick_and_morty_app/presentaion/widgets/characters_item.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<AppCharacters> allCharacters;
  @override
  void initState() {
    super.initState();
    allCharacters =
        BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.yellow,
        title: Text(
          'Characters',
          style: h5Bold,
        ),
      ),
      body: BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
          if (state is CharactersSuccess) {
            allCharacters = state.characters;
            return SingleChildScrollView(
              child: Container(
                color: AppColors.grey,
                child: Column(
                  children: [
                    GridView.builder(
                      itemCount: allCharacters.length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2 / 3,
                        crossAxisSpacing: 1,
                        mainAxisExtent: 1,
                      ),
                      itemBuilder: (context, index) {
                        return CharacterItem(
                          character: allCharacters[index],
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          }
          return const Center(
              child: CircularProgressIndicator(
            color: AppColors.yellow,
          ));
        },
      ),
    );
  }
}
