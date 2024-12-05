import 'package:flutter/material.dart';
import 'package:paws_envy/config/utils/colors.dart';
import 'package:paws_envy/config/utils/text.styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoogleBtn extends StatelessWidget {
  const GoogleBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: FilledButton.tonal(
        onPressed: () {},
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            Colors.transparent,
          ),
          side: WidgetStatePropertyAll(
            BorderSide(color: AppColors.gray, width: 1),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // google image
            SvgPicture.asset(
              'assets/icons/google_icon.svg',
              width: 35,
              height: 35,
            ),
            const SizedBox(width: 8),
            const Text(
              'Continue with Google',
              style: TextStyles.btnText,
            ),
            const SizedBox(width: 6),
          ],
        ),
      ),
    );
  }
}
