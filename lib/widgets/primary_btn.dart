import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
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
          style: TextStyles.btnText,
        ),
        const SizedBox(width: 6),
        const Icon(
          LineIcons.alternateLongArrowRight,
          size: 20,
        ),
      ],
    );
  }

  ButtonStyle _btnStyling() {
    return const ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(AppColors.lightPurple),
      side: WidgetStatePropertyAll(
        BorderSide(color: AppColors.gray, width: 1),
      ),
    );
  }
}
