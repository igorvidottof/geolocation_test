import 'package:flutter/material.dart';
import 'package:geolocation_test/utils/space_functions.dart';
import 'package:geolocation_test/utils/theme_data.dart';

class BotaoFuncionalidade extends StatelessWidget {
  const BotaoFuncionalidade({
    Key key,
    @required this.iconeUrl,
    @required this.texto,
    @required this.isCadastro,
    @required this.onPressed,
  }) : super(key: key);
  final String iconeUrl;
  final String texto;
  final bool isCadastro;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final temaTexto = Theme.of(context).textTheme;
    return Card(
      shadowColor: COR_AZUL,
      elevation: 3,
      child: InkWell(
        splashColor: COR_AZUL.withAlpha(30),
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Opacity(
                opacity: isCadastro ? 1 : 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: COR_CINZA,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.add,
                        size: 20,
                        color: COR_BRANCA,
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(
                iconeUrl,
                height: 80,
                width: 80,
              ),
              addEspacoVertical(15),
              Text(
                texto,
                style: temaTexto.bodyText2,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
