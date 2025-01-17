import 'package:flutter/material.dart';
import 'package:paws_envy/utils/colors.styles.dart';

class TextStyles {
  static final dimText = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: AppColors.black.withOpacity(0.7),
  );

  static final smallText = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: AppColors.black.withOpacity(0.9),
  );

  static final baseText = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: AppColors.black.withOpacity(0.9),
  );

  static const mediumText = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.w500,
    fontSize: 18,
  );

  static const largeText = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.w500,
    fontSize: 22,
  );

  static const baseHeading = TextStyle(
    color: AppColors.black,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const smallHeading = TextStyle(
    color: AppColors.black,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const mediumHeading = TextStyle(
    color: AppColors.black,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static const largeHeading = TextStyle(
    color: AppColors.black,
    fontSize: 28,
    fontWeight: FontWeight.w700,
  );

  static const xLargeHeading = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.w700,
    fontSize: 32,
  );

  static const mainHeading = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.w700,
    fontSize: 40,
  );

  static const btnText = TextStyle(
    color: AppColors.black,
    fontSize: 17,
    fontWeight: FontWeight.w400,
  );
}
