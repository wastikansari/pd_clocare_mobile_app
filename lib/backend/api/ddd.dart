// // import 'package:flutter/material.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';
// // import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// // import 'package:new_clocare_delivery_boy/utiles/app_constants.dart';

// // class MapWithPolyline extends StatefulWidget {
// //   @override
// //   _MapWithPolylineState createState() => _MapWithPolylineState();
// // }

// // class _MapWithPolylineState extends State<MapWithPolyline>
// //     with SingleTickerProviderStateMixin {
// //   GoogleMapController? mapController;
// //   List<LatLng> polylineCoordinates = [];
// //   Set<Polyline> _polylines = {};
// //   AnimationController? _animationController;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _animationController = AnimationController(
// //       vsync: this,
// //       duration:
// //           Duration(milliseconds: 2000), // Adjust animation duration as needed
// //     );
// //     fetchAndDrawPolyline();
// //   }

// //   @override
// //   void dispose() {
// //     _animationController!.dispose();
// //     super.dispose();
// //   }

// //   void fetchAndDrawPolyline() async {
// //     // Replace these with the actual origin and destination coordinates
// //     LatLng origin = const LatLng(22.305270835902757, 73.1732082253614);
// //     LatLng destination = const LatLng(22.301403180647416, 73.16911475738448);

// //     PolylinePoints polylinePoints = PolylinePoints();
// //     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
// //       AppConstants.MAP_API_KEY,
// //       PointLatLng(origin.latitude, origin.longitude),
// //       PointLatLng(destination.latitude, destination.longitude),
// //       travelMode: TravelMode.driving,
// //     );

// //     if (result.points.isNotEmpty) {
// //       result.points.forEach((PointLatLng point) {
// //         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
// //       });

// //       setState(() {
// //         _polylines.add(Polyline(
// //           polylineId: const PolylineId('polyline'),
// //           color: Colors.blue, // Adjust the color as needed
// //           width: 5, // Adjust the width as needed
// //           points: polylineCoordinates,
// //         ));
// //       });

// //       // Start the polyline animation
// //       _animationController!.forward();
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Polyline Animation'),
// //       ),
// //       body: GoogleMap(
// //         polylines: _polylines,
// //         initialCameraPosition: const CameraPosition(
// //           target: LatLng(22.305270835902757, 73.1732082253614),
// //           zoom: 12.0,
// //         ),
// //         onMapCreated: (GoogleMapController controller) {
// //           mapController = controller;
// //         },
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:new_clocare_delivery_boy/utiles/app_constants.dart';

// class MapWithPolyline extends StatefulWidget {
//   @override
//   _MapWithPolylineState createState() => _MapWithPolylineState();
// }

// class _MapWithPolylineState extends State<MapWithPolyline>
//     with SingleTickerProviderStateMixin {
//   GoogleMapController? _mapController;
//   List<LatLng> polylineCoordinates = [];
//   final Set<Polyline> _polylines = {};
//   AnimationController? _animationController;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration:
//           Duration(milliseconds: 2000), // Adjust animation duration as needed
//     );
//     fetchAndDrawPolyline();
//   }

//   @override
//   void dispose() {
//     _animationController!.dispose();
//     super.dispose();
//   }

//   void fetchAndDrawPolyline() async {
//     // Replace these with the actual origin and destination coordinates
//     LatLng origin = LatLng(22.305270835902757, 73.1732082253614);
//     LatLng destination = LatLng(22.313506407585773, 73.18647217943422);

//     PolylinePoints polylinePoints = PolylinePoints();
//     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(AppConstants.MAP_API_KEY,
//       PointLatLng(origin.latitude, origin.longitude),
//       PointLatLng(destination.latitude, destination.longitude),
//       travelMode: TravelMode.driving,
//     );

//     if (result.points.isNotEmpty) {
//       result.points.forEach((PointLatLng point) {
//         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//       });

//       _animatePolyline();
//     }
//   }

//   void _animatePolyline() {
//     _mapController!.animateCamera(CameraUpdate.newLatLngBounds(
//       LatLngBounds(
//         southwest: polylineCoordinates.first,
//         northeast: polylineCoordinates.last,
//       ),
//       100, // Adjust padding as needed
//     ));

//     _animationController!.forward();

//     _animationController!.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         _animationController!.reset();
//         _animatePolyline(); // Loop the animation
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Polyline Animation'),
//       ),
//       body: GoogleMap(
//         polylines:      {
//                       Polyline(
//                         polylineId: const PolylineId("route"),
//                         points: polylineCoordinates,
//                         color: const Color.fromARGB(255, 69, 96, 249),
//                         width: 4,
//                       ),
//                     },
//         initialCameraPosition: const CameraPosition(
//           target: LatLng(22.313506407585773, 73.18647217943422),

//           zoom: 12.0,
//         ),
//         onMapCreated: (GoogleMapController controller) {
//           _mapController = controller;
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:new_clocare_delivery_boy/utiles/app_constants.dart';

class MapWithPolyline extends StatefulWidget {
  @override
  _MapWithPolylineState createState() => _MapWithPolylineState();
}

class _MapWithPolylineState extends State<MapWithPolyline>
    with SingleTickerProviderStateMixin {
  GoogleMapController? _mapController;
  List<LatLng> polylineCoordinates = [];
  final Set<Polyline> _polylines = {};
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
          milliseconds: 5000), // Adjust animation duration as needed
    );
    fetchAndDrawPolyline();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  void fetchAndDrawPolyline() async {
    // Replace these with the actual origin and destination coordinates
    LatLng origin = const LatLng(22.30539987447543, 73.1736051923087);
    LatLng destination = const LatLng(22.305469356734456, 73.17098199180553);

    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      AppConstants.MAP_API_KEY,
      PointLatLng(origin.latitude, origin.longitude),
      PointLatLng(destination.latitude, destination.longitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      setState(() {
        for (var point in result.points) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        }

        _polylines.add(Polyline(
          polylineId: const PolylineId('polyline'),
          color: Colors.blue,
          width: 2,
          points: polylineCoordinates,
        ));
      });

      _animatePolyline();
    }
  }

  void _animatePolyline() {
    _animationController!.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Polyline Animation'),
      ),
      body: GoogleMap(
        polylines: _polylines,
        initialCameraPosition: const CameraPosition(
          target: LatLng(22.30539987447543, 73.1736051923087),
          zoom: 15.0,
        ),
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
      ),
    );
  }
}


