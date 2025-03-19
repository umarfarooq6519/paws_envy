import 'package:flutter/material.dart';

import 'package:paws_envy/utils/text.styles.dart';
import 'package:paws_envy/screens/Services/services_veterinarians.dart';
import 'package:paws_envy/screens/Services/services_grid.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  // ##### Services Screen #####
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          // ~ Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: _servicesHeader(),
          ),

          // ~ Content
          ServicesGridSection(),
          SizedBox(height: 35),
          ServicesVeterinarians(),
        ],
      ),
    );
  }

  // ###################################

  Column _servicesHeader() => Column(
        children: [
          Text(
            'Services',
            style:
                TextStyles.largeHeading.copyWith(fontWeight: FontWeight.w800),
          ),
          Text(
            'Care, Love, and Tail-Wagging Happiness!',
            style: TextStyles.baseText,
            textAlign: TextAlign.center,
          ),
        ],
      );
}
