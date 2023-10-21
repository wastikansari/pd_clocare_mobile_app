import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:new_clocare_delivery_boy/backend/api/pickup_api.dart';
import 'package:new_clocare_delivery_boy/backend/api/staff_api.dart';
import 'package:new_clocare_delivery_boy/backend/controller/staff_earing_data_controller.dart';
import 'package:new_clocare_delivery_boy/backend/models/staff/staff_earning.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/work/pending_pickups/not_able_to_pickup_screen.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/work/pending_pickups/quick_pickup_screen.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/work/pending_pickups/recording_screen.dart';
import 'package:new_clocare_delivery_boy/screen/widget/big_text.dart';
import 'package:new_clocare_delivery_boy/screen/widget/circleBox.dart';
import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/show_custom_snackbar.dart';
import 'package:new_clocare_delivery_boy/screen/widget/small_text.dart';
import 'package:new_clocare_delivery_boy/utiles/app_constants.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';
import 'pickup_garments_screen.dart';

class PickupStartScreen extends StatefulWidget {
  final String address;
  final String orderId;
  final String serviceId;
  final String miniOrderValue;

  const PickupStartScreen({
    Key? key,
    required this.address,
    required this.orderId,
    required this.miniOrderValue,
    required this.serviceId,
  }) : super(key: key);

  @override
  State<PickupStartScreen> createState() => PickupStartScreenState();
}

class PickupStartScreenState extends State<PickupStartScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  PickupApi pickupApi = PickupApi();
  StaffApi staffApi = StaffApi();
  String apiKey = AppConstants.MAP_API_KEY;

  LatLng startLocation = const LatLng(22.29953861195515, 73.1521957924497);
  LatLng? destination;
  String distances = '';
  String duration = '';
  double earnings = 0.0;
  bool isPickup = false;
  bool isLoading = false;

  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    super.initState();

    getAddressCoordinates(widget.address);

    destination = const LatLng(22.320483703366765, 73.15915297636651);
  }

  Future<Map<String, double>> getAddressCoordinates(String address) async {
    final encodedAddress = Uri.encodeComponent(address);
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?address=$encodedAddress&key=$apiKey';

    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);

    if (data['status'] == 'OK') {
      final location = data['results'][0]['geometry']['location'];
      final latitude = location['lat'];
      final longitude = location['lng'];
      setState(() {
        destination = LatLng(latitude, longitude);
      });

      getPolyPoints();
      setCustomMarkerIcon();

      getDistanceAndTime(startLocation, destination!).then((values) {
        setState(() {
          distances = values['distance'];
          duration = values['duration'];
          earnings =
              calculateEarnings(double.parse(distances.replaceAll(' km', '')));
        });
      }).catchError((error) {
        print(error);
      });

      return {'latitude': latitude, 'longitude': longitude};
    } else {
      throw Exception('Error: ${data['status']}');
    }
  }

  double calculateEarnings(double distanceInKm) {
    const ratePerKm = 2.50;
    return distanceInKm * ratePerKm;
  }

  List<LatLng> polylineCoordinates = [];

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyDutH2pi37uW2FKyzD06s-myx4nlyCyCMc', // Replace with your Google Maps API Key
      PointLatLng(startLocation.latitude, startLocation.longitude),
      PointLatLng(destination!.latitude, destination!.longitude),
    );
    print('data to get polypoint ${result.points}');
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        );
      }
      setState(() {});
    }
  }

  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(
      ImageConfiguration.empty,
      "assets/Pin_source.png",
    ).then((icon) {
      sourceIcon = icon;
    });
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "asset/image/home.png")
        .then((icon) {
      destinationIcon = icon;
    });
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "asset/image/home.png")
        .then((icon) {
      currentLocationIcon = icon;
    });
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(22.29953861195515, 73.1521957924497),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  Future<Map<String, dynamic>> getDistanceAndTime(
      LatLng startLocation, LatLng destination) async {
    final url = 'https://maps.googleapis.com/maps/api/distancematrix/json?'
        'origins=${startLocation.latitude},${startLocation.longitude}'
        '&destinations=${destination.latitude},${destination.longitude}'
        '&key=$apiKey';

    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);

    if (data['status'] == 'OK') {
      final distance = data['rows'][0]['elements'][0]['distance']['text'];
      final duration = data['rows'][0]['elements'][0]['duration']['text'];

      return {'distance': distance, 'duration': duration};
    } else {
      throw Exception('Error: ${data['status']}');
    }
  }

  void startPickUp() {
    _goToTheLake();
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Start Pickup'),
        content: const Text(
          'Do you really want to "START PICKUP", This action will send SMS to customer to inform about your pickup. This action cannot be UNDONE',
          style: TextStyle(fontSize: 15),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                isPickup = true;
              });
              // customerAddressDelete(addreesId, customerToken);
              _startPickupAction();
              Navigator.pop(context, 'OK');
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  _startPickupAction() {
    print('call');
    pickupApi.pickupStart(widget.orderId).then((value) {
      if (value.data!.status == 'ok') {
        showCustomSnackBar(
            title: 'Pickup', 'Pending order start for the pickup');
        print(value.data!.list![0].toString());
      } else {
        showCustomSnackBar(title: 'Error', value.data!.list![0].toString());
      }
    });
  }

  message(data) {
    if (data == true) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Star pickup action already taken'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            // TextButton(
            //   onPressed: () {
            //     setState(() {
            //       isPickup = true;
            //     });
            //     // customerAddressDelete(addreesId, customerToken);
            //     Navigator.pop(context, 'OK');
            //   },
            //   child: const Text('OK'),
            // ),
          ],
        ),
      );
    } else {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Error'),
          content: const Text(
              'Please first START button press, to start pickup the order'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
          ],
        ),
      );
    }
  }

  pickup() {
    isPickup ? dataSave() : message(false);
  }

  dataSave() {
    Get.put(DataController());
    StaffEaringData data = StaffEaringData(
      distance: distances,
      timeTaken: duration,
      earning: earnings.toString(),
      type: 'pickup',
    );
    Get.find<DataController>().saveData(data);
print('staffearing $data and ${data.distance}');
    bottomSheetPage(context);


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Pickup order track'),
        elevation: 1,
      ),
      body: destination == null
          ? const Center(child: Text("Loading"))
          : Column(
              children: [
                Expanded(
                  child: GoogleMap(
                    initialCameraPosition: const CameraPosition(
                        target: LatLng(22.29953861195515, 73.1521957924497),
                        // target: LatLng(currentLocation!.latitude!,
                        //     currentLocation!.longitude!),
                        zoom: 13.5,
                        tilt: 10),
                    markers: {
                      Marker(
                        markerId: const MarkerId("currentLocation"),
                        icon: currentLocationIcon,
                        position:
                            const LatLng(22.29953861195515, 73.1521957924497),
                      ),
                      Marker(
                        markerId: const MarkerId("source"),
                        icon: sourceIcon,
                        position: startLocation,
                      ),
                      // Marker(
                      //   markerId: const MarkerId("destination"),
                      //   icon: destinationIcon,
                      //   position: destination!,
                      // ),
                    },
                    onMapCreated: (mapController) {
                      _controller.complete(mapController);
                    },
                    polylines: {
                      Polyline(
                        polylineId: const PolylineId("route"),
                        points: polylineCoordinates,
                        color: const Color.fromARGB(255, 69, 96, 249),
                        width: 4,
                      ),
                    },
                  ),
                ),
                Container(
                  height: 380,
                  decoration: const BoxDecoration(
                    // color: AppColor.backgroundColor,
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.elliptical(20, 20),
                        topRight: Radius.elliptical(20, 20)),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 1.0,
                        color: Colors.grey,
                        spreadRadius: 0.2, //extend the shadow
                        // offset: Offset(
                        //   5.0, // Move to right 5  horizontally
                        //   5.0, // Move to bottom 5 Vertically
                        // ),
                      ),
                    ],
                  ),
                  child: Padding(
                      padding: const EdgeInsets.only(
                          top: 30, left: 15, right: 15, bottom: 15),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Column(
                                children: [
                                  Icon(
                                    Icons.trip_origin,
                                    color: Colors.blue,
                                  ),
                                  Height(4),
                                  Icon(Icons.more_vert,
                                      color: Color.fromARGB(255, 92, 175, 243),
                                      size: 19),
                                  Height(4),
                                  Icon(Icons.arrow_downward,
                                      color: Color.fromARGB(255, 92, 175, 243),
                                      size: 14),
                                  Height(4),
                                  Icon(Icons.more_vert,
                                      color: Color.fromARGB(255, 92, 175, 243),
                                      size: 19),
                                  Height(4),
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Height(3),
                                  const Text(
                                    'Starting point',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 6),
                                  const SizedBox(
                                      width: 270,
                                      height: 32,
                                      child: Text(
                                          'Shiv-Shakti Complex, Makrand Desai Rd, Harinagar, Vadodara, Gujarat 390015',
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey))),
                                  const SizedBox(height: 30),
                                  const Text(
                                    'Destination to pickup',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 6),
                                  SizedBox(
                                      width: 270,
                                      child: SizedBox(
                                        width: 270,
                                        height: 32,
                                        child: Text(widget.address,
                                            style: const TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey)),
                                      )),
                                  const SizedBox(height: 6),
                                ],
                              ),
                            ],
                          ),
                          const Height(3),
                          const Divider(),
                          Container(
                            width: double.infinity,
                            height: 80,
                            decoration: BoxDecoration(
                              // color: Colors.red,
                              // color: Color.fromARGB(255, 228, 241, 252),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 55,
                                    // width: 130,
                                    decoration: BoxDecoration(
                                      color: Colors.white12,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              74, 110, 110, 110)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SmallText(
                                            text: 'Distances',
                                            color: Colors.black,
                                            fontweights: FontWeight.w500,
                                          ),
                                          const Height(5),
                                          distances.isEmpty
                                              ? LoadingAnimationWidget
                                                  .fourRotatingDots(
                                                  color: AppColor.primaryColor1,
                                                  size: 15,
                                                )
                                              : SmallText(
                                                  text: distances,
                                                  size: 14,
                                                  color: AppColor.primaryColor1,
                                                  fontweights: FontWeight.w500,
                                                ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 55,
                                    decoration: BoxDecoration(
                                      color: Colors.white12,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              74, 110, 110, 110)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SmallText(
                                            text: 'Time taken',
                                            color: Colors.black,
                                            fontweights: FontWeight.w500,
                                          ),
                                          const Height(5),
                                          duration.isEmpty
                                              ? LoadingAnimationWidget
                                                  .fourRotatingDots(
                                                  color: AppColor.primaryColor1,
                                                  size: 15,
                                                )
                                              : SmallText(
                                                  text: duration,
                                                  size: 14,
                                                  color: AppColor.primaryColor1,
                                                  fontweights: FontWeight.w500,
                                                )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 55,
                                    decoration: BoxDecoration(
                                      color: Colors.white12,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              74, 110, 110, 110)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SmallText(
                                            text: 'Earning',
                                            color: Colors.black,
                                            fontweights: FontWeight.w500,
                                          ),
                                          const Height(5),
                                          earnings == 0.0
                                              ? LoadingAnimationWidget
                                                  .fourRotatingDots(
                                                  color: AppColor.primaryColor1,
                                                  size: 15,
                                                )
                                              : SmallText(
                                                  // text: '22',
                                                  text: '₹$earnings',
                                                  size: 14,
                                                  color: AppColor.primaryColor1,
                                                  fontweights: FontWeight.w500,
                                                )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Height(25),
                          // SmallText(text: '12-02-2023'),
                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    isPickup ? message(true) : startPickUp();
                                  },
                                  child: Container(
                                    height: 50,
                                    // width: 130,
                                    decoration: BoxDecoration(
                                      color: isPickup
                                          ? AppColor.backgroundColor
                                          : AppColor.primaryColor1,
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                          color: AppColor.primaryColor1),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: SmallText(
                                          text: 'Start',
                                          size: 16,
                                          color: isPickup
                                              ? AppColor.primaryColor1
                                              : Colors.white,
                                          fontweights: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const Widths(13),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    pickup();
                                  },
                                  child: Container(
                                    height: 50,
                                    // width: 130,
                                    decoration: BoxDecoration(
                                      color: isPickup
                                          ? AppColor.primaryColor1
                                          : AppColor
                                              .backgroundColor, //Colors.white,
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                          color: AppColor.primaryColor1),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: isLoading
                                            ? Center(
                                                child: LoadingAnimationWidget
                                                    .fourRotatingDots(
                                                color: Colors.white,
                                                size: 20,
                                              ))
                                            : SmallText(
                                                text: 'Pickup',
                                                size: 16,
                                                color: isPickup
                                                    ? Colors.white
                                                    : AppColor.primaryColor1,
                                                fontweights: FontWeight.w500,
                                              ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                )
              ],
            ),
    );
  }

  void bottomSheetPage(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.black,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10),
          ),
        ),
        context: context,
        builder: (context) {
          return Container(
            height: 330,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 5,
                  width: 45,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 128, 128, 128),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                const SizedBox(
                  height: 20,
                ),
                BigText(
                  text: 'Choose pickup type',
                  color: Colors.white,
                  size: 20,
                  fontweights: FontWeight.w500,
                ),
                const Height(20),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleBox(
                          title: 'Manually ',
                          tooltip: 'pickup customer order with manually',
                          icon: Image.asset('asset/image/laundry-basket.png'),
                          onPressed: () {
                            Navigator.of(context).pop();
                            Get.to(PickupGarmentsScreen(
                              orderId: widget.orderId,
                              miniOrderValue: widget.miniOrderValue,
                              serviceId: widget.serviceId,
                            ));
                          }),
                      // const SizedBox(
                      //   width: 25,
                      // ),
                      CircleBox(
                          title: 'Quick',
                          tooltip: 'pickup customer order with recording',
                          icon: Image.asset('asset/image/quick_pickup.png'),
                          onPressed: () {
                            setState(() {
                              Navigator.of(context).pop();
                              Get.to(QuickPickupScreen(
                                orderId: widget.orderId,
                              ));
                            });
                          }),
                      //        const SizedBox(
                      //   width: 25,
                      // ),
                      CircleBox(
                          title: 'Recorde',
                          tooltip: 'pickup customer order with recording',
                          icon: Image.asset('asset/image/voice.png'),
                          onPressed: () {
                            setState(() {
                              Navigator.of(context).pop();
                              Get.to(RecordeingScreen(
                                orderId: widget.orderId,
                              ));
                            });
                          }),
                    ],
                  ),
                ),
                const Height(20),
                SizedBox(
                    height: 60,
                    width: double.infinity,
                    // color: Colors.grey,

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                          onPressed: () {
                            print('not able to pickup ${widget.orderId}');
                            Get.to(NotAbleToPickup(
                              orderId: widget.orderId,
                            ));
                          },
                          child: Column(
                            children: [
                              SmallText(
                                text: 'Not able to pickup',
                                size: 13,
                                fontweights: FontWeight.w500,
                                color: AppColor.primaryColor1,
                              ),
                            ],
                          )),
                    ))
              ],
            ),
          );
        });
  }
}
