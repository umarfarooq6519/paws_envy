import 'package:flutter/material.dart';
import 'package:paws_envy/services/auth.service.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:paws_envy/utils/colors.styles.dart';
import 'package:paws_envy/utils/text.styles.dart';

class GoogleBtn extends StatelessWidget {
  const GoogleBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: FilledButton.tonal(
        onPressed: () async {
          try {
            await AuthService().signInWithGoogle();
            // Navigator.pushNamed(context, '/role');
          } catch (e) {
            // Handle errors, e.g., display an error message to the user
            print("Error signing in with Google: $e");
          }
        },
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
              width: 33,
              height: 33,
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
