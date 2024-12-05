import 'package:flutter/material.dart';
import 'package:paws_envy/config/utils/colors.dart';
import 'package:paws_envy/config/utils/text.styles.dart';

class PrimaryBtn extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryBtn({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: FilledButton.tonal(
        onPressed: onPressed,
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(AppColors.lightPurple),
          side: WidgetStatePropertyAll(
            BorderSide(color: AppColors.gray, width: 1),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyles.btnText,
            ),
            const SizedBox(width: 6),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
