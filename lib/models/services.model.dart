import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Services {
  final String name;
  final IconData icon;

  Services({
    required this.name,
    required this.icon,
  });
}

List<Services> services = [
  Services(
    name: 'Medication',
    icon: LineIcons.pills,
  ),
  Services(
    name: 'Vaccination',
    icon: LineIcons.syringe,
  ),
  Services(
    name: 'Pet Walking',
    icon: LineIcons.walking,
  ),
];
