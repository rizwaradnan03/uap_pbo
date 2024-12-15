import 'package:flutter/material.dart';

class MenuOption {
  final String title;
  final IconData icon;
  final void Function(BuildContext context) onTap;

  MenuOption({required this.title, required this.icon, required this.onTap});
}