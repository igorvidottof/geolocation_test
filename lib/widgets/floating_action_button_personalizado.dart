import 'package:flutter/material.dart';
import 'package:geolocation_test/utils/theme_data.dart';

class FloatingActionButtonPersonalizado extends StatelessWidget {
  const FloatingActionButtonPersonalizado({Key key, this.icone, this.onPressed})
      : super(key: key);
  final IconData icone;
  final void Function(BuildContext context) onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: COR_AZUL,
      child: Icon(
        icone,
        color: COR_BRANCA,
      ),
      onPressed: () => onPressed(context),
    );
  }
}
