import 'package:flutter/material.dart';
import 'package:paws_envy/config/utils/colors.dart';
import 'package:paws_envy/config/utils/text.styles.dart';

class PurpleChip extends StatelessWidget {
  final String text;

  const PurpleChip({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: AppColors.lightPurple,
      label: Text(
        text,
        style: AppText.baseText,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(color: Color.fromARGB(255, 175, 142, 211)),
      ),
    );
  }
}
