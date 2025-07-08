import 'package:geolocator/geolocator.dart';

import 'permission_service.dart';

class LocationService {
  static Future<Position?> determinePosition() async {
    final isGranted = await PermissionService.requestLocationPermission();
    if (!isGranted) {
      return null;
    }
    return await Geolocator.getCurrentPosition();
  }
}
