import 'package:flutter/material.dart';
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
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.transparent),
          side: WidgetStatePropertyAll(
            BorderSide(color: Colors.black87, width: 1),
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
            const SizedBox(width: 8),
            const Icon(
              Icons.arrow_forward,
              size: 20,
              color: Colors.black87,
            ),
          ],
        ),
      ),
    );
  }
}
