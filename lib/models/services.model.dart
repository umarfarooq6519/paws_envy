import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Services {
  final String name;
  final Icon icon;

  Services({
    required this.name,
    required this.icon,
  });
}

List<Services> services = [
  Services(
    name: 'Medication',
    icon: const Icon(LineIcons.pills),
  ),
  Services(
    name: 'Vaccination',
    icon: const Icon(LineIcons.syringe),
  ),
  Services(
    name: 'Pet Walking',
    icon: const Icon(LineIcons.walking),
  ),
];
