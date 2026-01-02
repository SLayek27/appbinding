import 'package:flutter/material.dart';

class BottomNavItem {
  final IconData icon;
  final String? label;
  final Color activeColor;
  final Color inactiveColor;
  final VoidCallback onTap;

  BottomNavItem({
    required this.icon,
    required this.onTap,
    this.label,
    this.activeColor = Colors.white,
    this.inactiveColor = Colors.grey,
  });
}