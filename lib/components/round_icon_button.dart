import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final Color buttonColor;
  final Icon selectedIcon;
  final IconData icon;
  final Function onPressed;

  RoundIconButton(
      {@required this.icon,
        this.buttonColor,
        this.selectedIcon,
        @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: buttonColor,
      onPressed: onPressed,
    );
  }
}