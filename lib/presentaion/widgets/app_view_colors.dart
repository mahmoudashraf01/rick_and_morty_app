import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/constants/colors.dart';
import 'package:rick_and_morty_app/presentaion/widgets/custom_filter.dart';

class AppViewColor extends StatelessWidget {
  const AppViewColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: const AlignmentDirectional(0, 1),
          child: Container(
            height: 600,
            width: 300,
            decoration: const BoxDecoration(
              color: AppColors.orange,
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(3, -0.6),
          child: Container(
            height: 500,
            width: 300,
            decoration: BoxDecoration(
              color: AppColors.deepOrange,
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(-3, -0.6),
          child: Container(
            height: 500,
            width: 300,
            decoration:  BoxDecoration(
              color:AppColors.deepOrange,
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(0, -1.2),
          child: Container(
            height: 300,
            width: 300,
            decoration: const BoxDecoration(
              color: AppColors.yellow,
            ),
          ),
        ),
        const CustomFilter(),
      ],
    );
  }
}
