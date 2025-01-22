import 'package:flutter/material.dart';
import 'package:paws_envy/utils/colors.styles.dart';

class ShadowStyles {
  static final xSmallShadow = BoxShadow(
    color: AppColors.primary.withOpacity(0.8),
    blurRadius: 6,
    spreadRadius: 0,
  );

  static final smallShadow = BoxShadow(
    color: AppColors.primary.withOpacity(0.8),
    blurRadius: 8,
    spreadRadius: 1,
  );

  static final mediumShadow = BoxShadow(
    color: AppColors.primary.withOpacity(0.8),
    blurRadius: 10,
    spreadRadius: 2,
  );

  static final largeShadow = BoxShadow(
    color: AppColors.primary.withOpacity(0.8),
    blurRadius: 12,
    spreadRadius: 3,
  );
}
