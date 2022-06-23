import 'package:geocoder/geocoder.dart';

Future<void> main() async {
  final query = "1600 Amphiteatre Parkway, Mountain View";
  var addresses = await Geocoder.local.findAddressesFromQuery(query);
  var first = addresses.first;
  print("${first.featureName} : ${first.coordinates}");
}
