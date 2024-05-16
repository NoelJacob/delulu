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
        padding: MaterialStatePropertyAll(EdgeInsets.fromLTRB(8, 0, 10, 0)),
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        )),
        iconSize: MaterialStatePropertyAll(20),
        // overlayColor: MaterialStatePropertyAll(Colors.transparent),
        splashFactory: NoSplash.splashFactory,
        // foregroundColor: MaterialStateProperty.resolveWith((states) {
        //   if (states.contains(MaterialState.focused) ||
        //       states.contains(MaterialState.hovered) ||
        //       states.contains(MaterialState.pressed)) {
        //     return Colors.white;
        //   } else {
        //     return Theme.of(context).colorScheme.primary;
        //   }
        // }),
      ),
      icon: Icon(icon),
      label: Text(label),
    );
  }
}
