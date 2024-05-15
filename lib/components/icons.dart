import 'package:flutter/material.dart';

class TextBoxIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const TextBoxIcon(
    this.icon,
    this.label, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      style: ButtonStyle(
        padding: MaterialStatePropertyAll(EdgeInsets.zero),
        iconSize: MaterialStatePropertyAll(20),
        overlayColor: MaterialStatePropertyAll(Colors.transparent),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.hovered)) {
            return Theme.of(context).colorScheme.primary;
          } else {
            return Colors.white70;
          }
        }),
      ),
      icon: Icon(icon),
      label: Text(label),
    );
  }
}
