import 'package:geolocator/geolocator.dart';

///Гео-сервис
abstract class GeoService{
  ///Определить позицию
  static Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    final currPos = await Geolocator.getCurrentPosition();
    // if(kDebugMode){
    //   print(currPos.latitude);
    //   print(currPos.longitude);
    // }
    return currPos;
  }
  ///Проверка доступов
  static Future<void> checkPermissions() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      await Geolocator.openLocationSettings();
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
  }
  ///Проверка, находится ли точка врадиусе проверки
  static bool isPositionInArea({required Position currPosition,required double latitude,required double longtitude,required double maxRadius,required double minRadius}){
    return Geolocator.distanceBetween(currPosition.latitude,currPosition.longitude, latitude, longtitude)<=maxRadius&&Geolocator.distanceBetween(currPosition.latitude,currPosition.longitude, latitude, longtitude)>=minRadius;
  }
}