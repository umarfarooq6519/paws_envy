import 'package:flutter/material.dart';
import 'package:paws_envy/config/utils/text.styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/dog.svg',
              height: 100.0,
              width: 100.0,
            ),

            const Text(
              'PawsEnvy',
              style: TextStyles.mainHeading,
            ),
            const Text(
              'Your Personal Pet Management App',
              style: TextStyles.largeText,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            // ##### Text Field #####
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 50),

            FilledButton.tonal(
              onPressed: () {},
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.black),
                padding: WidgetStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
              ),
              child: const Text(
                'Continue',
                style: TextStyles.btnText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
