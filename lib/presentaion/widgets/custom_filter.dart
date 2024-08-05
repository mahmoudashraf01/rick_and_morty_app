import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/constants/colors.dart';

class CustomFilter extends StatelessWidget {
  const CustomFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.transparent,
        ),
      ),
    );
  }
}
