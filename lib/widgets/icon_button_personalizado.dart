import 'package:flutter/material.dart';
import 'package:geolocation_test/utils/theme_data.dart';

class IconButtonPersonalizado extends StatelessWidget {
  const IconButtonPersonalizado({
    Key key,
    this.icon,
    this.onPressed,
  }) : super(key: key);
  final IconData icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: COR_CINZA.withAlpha(100),
      onTap: onPressed,
      borderRadius: BorderRadius.circular(50),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Icon(
          icon,
          size: 20,
        ),
      ),
    );
  }
}
