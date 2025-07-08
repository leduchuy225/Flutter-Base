import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:geolocator/geolocator.dart';

class PermissionService {
  static Future<NotificationSettings> requestNotificationPermission() {
    return FirebaseMessaging.instance.requestPermission();
  }

  static Future<bool> requestLocationPermission() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }

    return [
      LocationPermission.always,
      LocationPermission.whileInUse,
    ].contains(permission);
  }
}
