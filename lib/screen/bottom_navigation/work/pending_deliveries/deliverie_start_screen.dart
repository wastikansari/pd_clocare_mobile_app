import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:location/location.dart';
import 'package:new_clocare_delivery_boy/backend/api/delivery_api.dart';
import 'package:new_clocare_delivery_boy/backend/api/staff_api.dart';
import 'package:new_clocare_delivery_boy/backend/controller/staff_earing_data_controller.dart';
import 'package:new_clocare_delivery_boy/backend/logic/current_location.dart';
import 'package:new_clocare_delivery_boy/backend/models/staff/staff_earning.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/work/pending_deliveries/order_deliver_screen.dart';
import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/show_custom_snackbar.dart';
import 'package:new_clocare_delivery_boy/screen/widget/small_text.dart';
import 'package:new_clocare_delivery_boy/utiles/app_constants.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';

class DeliveriesStartScreen extends StatefulWidget {
  final String address;
  final String orderId;
  const DeliveriesStartScreen(
      {Key? key, required this.address, required this.orderId})
      : super(key: key);

  @override
  State<DeliveriesStartScreen> createState() => DeliveriesStartScreenState();
}

class DeliveriesStartScreenState extends State<DeliveriesStartScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  DeliveryApi deliveryApi = DeliveryApi();
   var dataCon = Get.find<DataController>();
  StaffApi staffApi = StaffApi();
  String apiKey = AppConstants.MAP_API_KEY;

  LatLng startLocation = const LatLng(22.29953861195515, 73.1521957924497);
  LatLng? destination;

  String distances = '';
  String duration = '';
  double earnings = 0.0;
  // bool isVisibal = false;
  bool isDeliver = false;
  bool isLoading = false;

  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    super.initState();

    getAddressCoordinates(widget.address);
    destination = const LatLng(22.29953861195515, 73.1521957924497);
  }

  Future<Map<String, double>> getAddressCoordinates(String address) async {
    final encodedAddress = Uri.encodeComponent(address);
    final url ='https://maps.googleapis.com/maps/api/geocode/json?address=$encodedAddress&key=$apiKey';

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
          earnings =calculateEarnings(double.parse(distances.replaceAll(' km', ''))); });
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
  // LocationData? currentLocation;

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(apiKey, 
      PointLatLng(startLocation.latitude, startLocation.longitude),
      PointLatLng(destination!.latitude, destination!.longitude),
    );
    print('data to get polypoint ${result.points}');
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude),
        );
      }
      setState(() {});
    }
  }

  // void getCurrentLocation(){
  //   Location location =  Location();
  //     // location getCurrentLocation = GetCurrentLocation();
  //  location.getLocation().then((value) {
  //   currentLocation = value;
  //   print(" fffffffffffffff ${currentLocation!.latitude!}, ${currentLocation!.longitude!}");
  //   print('curent location $currentLocation and ddd $value al the value');
    
  //  });
  // }


  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty,"assets/household.png",).then((icon) {
      sourceIcon = icon;
    });
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, "asset/image/home.png").then((icon) {
      destinationIcon = icon;
    });
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, "asset/image/Pin_source.png").then((icon) {
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

  void startDelivery() {
    _goToTheLake();
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Start Delivery'),
        content: const Text(
            'Do you really want to Start Delivery, This action will send SMS to customer to inform about your delivery. This action cannot be UNDONE'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                isDeliver = true;
              });
              // customerAddressDelete(addreesId, customerToken);
              _startDelivery();
              Navigator.pop(context, 'OK');
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  _startDelivery() {
    print('_startDelivery call');
    deliveryApi.deliveryStart(widget.orderId).then((value) {
      // if (value.success == true) {
      //    showCustomSnackBar( title: 'Deliver', 'Please your usrname and userName address');
      // }
      // print("${value.success}");

      if (value.data!.status == 'ok') {
        showCustomSnackBar(
            title: 'Deliver', 'Pending order start for the deliver');
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
          content: const Text('Star delivery action already taken'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            // TextButton(
            //   onPressed: () {
            //     setState(() {
            //       isDeliver = true;
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
              'Please first START button press, to start deliver the order'),
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

  deliver() {
    isDeliver ? dataSave() : message(false);
  }

  dataSave() {
           Get.put(DataController());
    StaffEaringData data = StaffEaringData(
      distance: distances,
      timeTaken: duration,
      earning: earnings.toString(),
      type: 'deliver',
    );
        Get.to(OrderDeliverScreen(orderId: widget.orderId,));
    Get.find<DataController>().saveData(data); // Save the data using the DataController


    // setState(() {
    //   isLoading = true;
    // });
    // final String distance = distances;
    // final String timeTaken = duration;
    // final String earning = earnings.toString();
    // final String type = 'deliver';
// Use Get.to() to navigate to Screen4
    // await staffApi
    //     .staffPerOrderEarning(distance, timeTaken, earning, type)
    //     .then((value) {
    //   setState(() {
    //     isLoading = false;
    //   });
    //   print('staff data ${value.data!.status}');
    //   // Get.to(OrderDeliverScreen( orderId: widget.orderId, ));
    // });
    // setState(() {
    //   isLoading = false;
    // });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Deliverie order track'),
        elevation: 1,
      ),
      body: destination == null 
          ? LoadingAnimationWidget.fourRotatingDots(
                  color: AppColor.primaryColor2,
                  size: 60,
                )
          : Column(
              children: [
                Expanded(
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                        target: startLocation,
                        zoom: 13.5,
                        tilt: 10),
                    markers: {
                      // Marker(
                      //   markerId: const MarkerId("currentLocation"),
                      //   icon: currentLocationIcon,
                      //   position: LatLng(currentLocation!.latitude!, currentLocation!.longitude!)
                      //   //const LatLng(22.29953861195515, 73.1521957924497),
                      // ),
                      Marker(
                        markerId: const MarkerId("source"),
                        icon: sourceIcon,
                        position: startLocation,
                      ),
                      Marker(
                        markerId: const MarkerId("destination"),
                        icon: destinationIcon,
                        position: destination!,
                      ),
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
                                    'Destination to delivery',
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
                                    isDeliver ? message(true) : startDelivery();
                                  },
                                  child: Container(
                                    height: 50,
                                    // width: 130,
                                    decoration: BoxDecoration(
                                      color: isDeliver
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
                                          color: isDeliver
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
                                    deliver();
                                  },
                                  child: Container(
                                    height: 50,
                                    // width: 130,
                                    decoration: BoxDecoration(
                                      color: isDeliver
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
                                                text: 'Deliver',
                                                size: 16,
                                                color: isDeliver
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
}
