import 'package:flutter/material.dart';
import 'package:paws_envy/utils/colors.styles.dart';
import 'package:paws_envy/utils/text.styles.dart';

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
      height: 52,
      child: FilledButton.tonal(
        onPressed: onPressed,
        style: _btnStyling(),
        child: _btnContainer(),
      ),
    );
  }

  Widget _btnContainer() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyles.baseText,
        ),
        // const Icon(
        //   LineIcons.alternateLongArrowRight,
        //   size: 20,
        // ),
      ],
    );
  }

  ButtonStyle _btnStyling() {
    return const ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(AppColors.primary),
      side: WidgetStatePropertyAll(
        BorderSide(color: AppColors.gray, width: 1),
      ),
    );
  }
}
