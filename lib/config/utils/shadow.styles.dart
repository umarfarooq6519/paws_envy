import 'package:flutter/material.dart';
import 'package:paws_envy/config/utils/colors.styles.dart';

class ShadowStyles {
  static const xSmallShadow = BoxShadow(
    color: AppColors.primary,
    blurRadius: 6,
    spreadRadius: 0,
  );

  static const smallShadow = BoxShadow(
    color: AppColors.primary,
    blurRadius: 8,
    spreadRadius: 1,
  );

  static const mediumShadow = BoxShadow(
    color: AppColors.primary,
    blurRadius: 10,
    spreadRadius: 2,
  );

  static const largeShadow = BoxShadow(
    color: AppColors.primary,
    blurRadius: 12,
    spreadRadius: 3,
  );
}
