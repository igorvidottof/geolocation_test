import 'package:flutter/material.dart';
import 'package:geolocation_test/utils/space_functions.dart';
import 'package:geolocation_test/utils/theme_data.dart';
import 'package:map_launcher/map_launcher.dart';

class HomeScreenBody extends StatelessWidget {
  Future<void> abrirMaps(BuildContext context) async {
    final availableMaps = await MapLauncher.installedMaps;

    final result = await MapLauncher.showDirections(
      mapType: availableMaps.first.mapType,
      origin: Coords(-23.102995211260748, -48.916977832316185),
      destination: Coords(-22.88156634645483, -48.459163060527246),
      destinationTitle: 'Botucatu',
      originTitle: 'Minha localização',
    );

    print('----------------------------------------');
    print(result);
    print('----------------------------------------');
  }

  @override
  Widget build(BuildContext context) {
    final temaTexto = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            'Abra o Google Maps e veja onde você está no mapa',
            style: temaTexto.headline2,
            textAlign: TextAlign.center,
          ),
          addEspacoVertical(10),
          OutlineButton(
            child: Text('Abrir Maps'),
            textColor: COR_AZUL,
            borderSide: BorderSide(color: COR_AZUL, width: 2),
            onPressed: () => abrirMaps(context),
          ),
        ],
      ),
    );
  }
}
