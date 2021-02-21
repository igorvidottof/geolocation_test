import 'package:geocoder/geocoder.dart';
import 'package:map_launcher/map_launcher.dart';

class MapsService {
  static Future<Coords> _pesquisaLocal(String destino) async {
    var addresses = await Geocoder.local.findAddressesFromQuery(destino);
    var primeiro = addresses.first;
    print("${primeiro.featureName} : ${primeiro.coordinates}");
    return Coords(
      primeiro.coordinates.latitude,
      primeiro.coordinates.longitude,
    );
  }

  static Future<void> abrirMaps(String destino) async {
    final availableMaps = await MapLauncher.installedMaps;

    final destinoCoords = await MapsService._pesquisaLocal(destino);

    final result = await MapLauncher.showDirections(
      mapType: availableMaps.first.mapType,
      destination: destinoCoords,
      destinationTitle: 'Destino',
      originTitle: 'Minha localização',
    );
  }
}
