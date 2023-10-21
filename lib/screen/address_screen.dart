// import 'package:clocare_boy/screen/widget/show_custom_snackbar.dart';
// import 'package:clocare_boy/utiles/themes/ColorConstants.dart';
// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';

// class AddressScreen extends StatefulWidget {
//   const AddressScreen({Key? key}) : super(key: key);

//   @override
//   State<AddressScreen> createState() => _AddressScreenState();
// }

// class _AddressScreenState extends State<AddressScreen> {
//   String? _currentAddress;
//   Position? _currentPosition;
//   final String _selectedState = '';
//   final String _selectedLocation = '';

//   Future<bool> _handleLocationPermission() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       showCustomSnackBar(
//           title: 'Location',
//           'Location are disabled, Please enable the Location');
//       return false;
//     }
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         showCustomSnackBar(
//             title: 'Permissions', 'Location permissions are denied');

//         return false;
//       }
//     }
//     if (permission == LocationPermission.deniedForever) {
//       showCustomSnackBar(
//           title: 'Permissions',
//           'Location permissions are permanently denied, we cannot request permissions.');

//       return false;
//     }
//     return true;
//   }

//   Future<void> _getCurrentPosition() async {
//     final hasPermission = await _handleLocationPermission();

//     if (!hasPermission) return;
//     await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
//         .then((Position position) {
//       setState(() => _currentPosition = position);
//       _getAddressFromLatLng(_currentPosition!);
//     }).catchError((e) {
//       debugPrint(e);
//     });
//   }

//   Future<void> _getAddressFromLatLng(Position position) async {
//     await placemarkFromCoordinates(
//             _currentPosition!.latitude, _currentPosition!.longitude)
//         .then((List<Placemark> placemarks) {
//       Placemark place = placemarks[0];
//       setState(() {
//         _currentAddress =
//             '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
//       });
//     }).catchError((e) {
//       debugPrint(e);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Location', style: theme.textTheme.headlineSmall),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: Container(
//                 height: 45,
//                 decoration: BoxDecoration(
//                     color: Get.isDarkMode
//                         ? ColorConstants.gray600
//                         : Colors.grey.shade200,
//                     borderRadius: BorderRadius.circular(10)),
//                 child: const TextField(
//                   decoration: InputDecoration(
//                     contentPadding:
//                         EdgeInsets.symmetric(vertical: 0, horizontal: 20),
//                     hintText: "Search city, area, or neighborhood",
//                     prefixIcon: Icon(Icons.search),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16.0),
//             Row(
//               children: [
//                 const Icon(
//                   Icons.location_searching_outlined,
//                   color: Colors.blue,
//                 ),
//                 TextButton(
//                   onPressed: () {},
//                   child: Text(
//                     'Use Current Location',
//                     style: theme.textTheme.bodyLarge?.copyWith(
//                         fontWeight: FontWeight.bold, color: Colors.blue),
//                   ),
//                 )
//               ],
//             ),
//             // ElevatedButton(
//             //   child: const Text('Use Current Location'),
//             //   onPressed: () async {
//             //     _getCurrentPosition();
//             //   },
//             // ),
//             const SizedBox(height: 16.0),
//             const SizedBox(height: 16.0),
//             Text(
//               'Selected State: $_selectedState',
//               style: const TextStyle(fontSize: 16.0),
//             ),
//             const SizedBox(height: 16.0),
//             Text(
//               'Selected Location: $_currentAddress',
//               style: const TextStyle(fontSize: 16.0),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
