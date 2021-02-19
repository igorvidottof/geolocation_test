import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocation_test/utils/space_functions.dart';
import 'package:geolocation_test/utils/theme_data.dart';
import 'package:map_launcher/map_launcher.dart';

class HomeScreenMaps extends StatelessWidget {
  Future<void> abrirMaps(BuildContext context, Coords destination) async {
    final availableMaps = await MapLauncher.installedMaps;

    final result = await MapLauncher.showDirections(
      mapType: availableMaps.first.mapType,
      origin: Coords(-23.097688378149012, -48.923019103011406),
      destination: destination,
      destinationTitle: 'Casas Bahia',
      originTitle: 'Casa',
    );
  }

  Future<Coords> pesquisaLocal() async {
    // From a query
    final query = "Banco Bradesco - Águas de Santa Bárbara - SP";
    var addresses = await Geocoder.local.findAddressesFromQuery(query);
    var first = addresses.first;
    print("${first.featureName} : ${first.coordinates}");
    return Coords(
      first.coordinates.latitude,
      first.coordinates.longitude,
    );
  }

  @override
  Widget build(BuildContext context) {
    final temaTexto = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Maps'),
      ),
      body: Container(
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
              child: Text('Pesquisar Local'),
              textColor: COR_AZUL,
              borderSide: BorderSide(color: COR_AZUL, width: 2),
              onPressed: pesquisaLocal,
            ),
            OutlineButton(
                child: Text('Abrir Maps'),
                textColor: COR_AZUL,
                borderSide: BorderSide(color: COR_AZUL, width: 2),
                onPressed: () async {
                  final coords = await pesquisaLocal();
                  abrirMaps(context, coords);
                }),
          ],
        ),
      ),
    );
  }
}
