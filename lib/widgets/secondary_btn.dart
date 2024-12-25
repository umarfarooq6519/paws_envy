import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:paws_envy/config/utils/colors.styles.dart';
import 'package:paws_envy/config/utils/text.styles.dart';

class SecondaryBtn extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SecondaryBtn({
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
        child: _btnContainer(text),
      ),
    );
  }
}

ButtonStyle _btnStyling() {
  return const ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(Colors.transparent),
    side: WidgetStatePropertyAll(
      BorderSide(color: AppColors.gray, width: 1),
    ),
  );
}

Widget _btnContainer(text) {
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
