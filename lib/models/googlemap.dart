import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


GoogleMap showMap(double lat, double lng) {

  GoogleMap map = GoogleMap(
    initialCameraPosition: CameraPosition(
      target: LatLng(lat, lng),
      zoom: 12
    ),
    mapType: MapType.normal,
    myLocationEnabled: true,
    myLocationButtonEnabled: true,
  );

  return map;
}


Future<GoogleMap> getCurrentLocation() async {

  Position _current = await Geolocator.getCurrentPosition();
  
  GoogleMap _map = showMap(_current.latitude, _current.longitude);

  return _map;
}


Future<bool> checkLocationService() async {

  bool isLocationServiceEnabled  = await Geolocator.isLocationServiceEnabled();

  return isLocationServiceEnabled;
}


Future<int> checkPermission() async {

  LocationPermission permission = await Geolocator.checkPermission();

  if(permission == LocationPermission.whileInUse) {
    return 0;
  }else if(permission == LocationPermission.denied) {
    return 1;
  }else{
    return 2;
  }
}


callMap() async {

  int permission = await checkPermission();
  bool locationService = await checkLocationService();

  if(permission == 0) {
    return 0;
  }else if(permission == 1) {
    return 1;
  }else if(locationService == false) {
    return 2;
  }else{
    GoogleMap map = await getCurrentLocation();
    return map;
  }

}
