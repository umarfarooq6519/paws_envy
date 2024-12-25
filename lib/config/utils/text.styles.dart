import 'package:flutter/material.dart';
import 'package:paws_envy/config/utils/colors.styles.dart';

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
    fontWeight: FontWeight.w500,
    fontSize: 18,
  );

  static const largeText = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 22,
  );

  static const baseHeading = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const smallHeading = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const normalHeading = TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.w700,
  );

  static const mediumHeading = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static const largeHeading = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
  );

  static const xLargeHeading = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 32,
  );

  static const mainHeading = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 40,
  );

  static const btnText = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w400,
  );
}
