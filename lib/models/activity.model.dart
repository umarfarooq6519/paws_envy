import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Activity {
  final String title;
  final String time;
  final IconData icon;
  final String imageUrl; // Add image URL here

  Activity({
    required this.title,
    required this.time,
    required this.icon,
    required this.imageUrl, // Pass image URL in constructor
  });
}

final List<Activity> activities = [
  Activity(
    title: 'Morning Walk',
    time: '9:45 AM',
    icon: LineIcons.walking,
    imageUrl: 'assets/images/dog_1.jpg', // Path to your image
  ),
  Activity(
    title: 'Vaccination Appointment',
    time: '10:45 AM',
    icon: LineIcons.medicalBriefcase,
    imageUrl: 'assets/images/cat_1.jpg', // Path to your image
  ),
  Activity(
    title: 'Playtime',
    time: '11:45 AM',
    icon: LineIcons.play,
    imageUrl: 'assets/images/cat_2.jpg', // Path to your image
  ),
];
