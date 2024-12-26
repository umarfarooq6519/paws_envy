import 'package:flutter/material.dart';

class PetScreen extends StatefulWidget {
  const PetScreen({super.key});

  @override
  State<PetScreen> createState() => _PetScreenState();
}

class _PetScreenState extends State<PetScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Center(
          child: Column(
            children: [
              Text('Pets'),
            ],
          ),
        ),
      ],
    );
  }
}
