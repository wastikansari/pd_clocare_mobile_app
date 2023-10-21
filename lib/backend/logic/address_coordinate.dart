// import 'dart:convert';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:http/http.dart' as http;

// class AddressCoordinates {
//   Future<Map<String, double>> getAddressCoordinates(String address) async {
//     final encodedAddress = Uri.encodeComponent(address);
//     final url = 'https://maps.googleapis.com/maps/api/geocode/json?address=$encodedAddress&key=$apiKey';
//     final response = await http.get(Uri.parse(url));
//     final data = jsonDecode(response.body);
//     if (data['status'] == 'OK') {
//       final location = data['results'][0]['geometry']['location'];
//       final latitude = location['lat'];
//       final longitude = location['lng'];

//       var destination = LatLng(latitude, longitude);

//       // getDistanceAndTime(startLocation, destination!).then((values) {
//       //   setState(() {
//       //     distances = values['distance'];
//       //     duration = values['duration'];
//       //     earnings = calculateEarnings(double.parse(distances.replaceAll(' km', '')));
//       //   });
//       // }).catchError((error) {
//       //   print(error);
//       // });

//       return {'latitude': latitude, 'longitude': longitude};
//     } else {
//       throw Exception('Error: ${data['status']}');
//     }
//   }
// }
