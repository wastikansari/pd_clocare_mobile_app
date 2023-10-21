import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:new_clocare_delivery_boy/routes/routes_page.dart';
import 'package:new_clocare_delivery_boy/screen/onboarding/intro_screen.dart';
import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/small_text.dart';
import 'package:new_clocare_delivery_boy/utiles/app_asset.dart';
import 'package:new_clocare_delivery_boy/utiles/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _permissionsGiven = false;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      _checkPermissions();
    });
  }

  insideapp() async {
    final prefs = await SharedPreferences.getInstance();
    final showHome = prefs.getBool('showHome') ?? false;
    showHome ? _checkLogedIn() : Get.offAll(const OnboardingScreen());
  }

  Future<void> _checkPermissions() async {
    // Check if all permissions are granted
    var locationStatus = await Permission.location.status;

    if (locationStatus.isGranted) {
      setState(() {
        _permissionsGiven = true;
      });
      insideapp();
    } else {
      setState(() {
        _permissionsGiven = false;
      });
      showPermissionDisclosure();
    }
  }

  Future<void> requestPermissions() async {
    var locationStatus = await Permission.location.request();

    if (locationStatus.isGranted) {
      setState(() {
        _permissionsGiven = true;
      });
      insideapp();
    } else {
      setState(() {
        _permissionsGiven = false;
      });
      showPermissionDisclosure();
    }
  }

  void errormsg() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Permissions are required to use this app.'),
        action: SnackBarAction(
            label: 'Allow',
            textColor: AppColor.primaryColor1,
            onPressed: () {
              showPermissionDisclosure();
            }),
      ),
    );

    _checkLogedIn();
  }

  void showPermissionDisclosure() {
    showCupertinoDialog<String>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Location Access Required'),
        content: Column(
          children: [
            Height(10),
            SmallText(
              text:
                  'In order to provide accurate pickup and delivery estimates, '
                  'app requires access to your device\'s location.',
              color: Colors.black,
              overFlow: TextOverflow.visible,
            ),
            Height(6),
            Image.asset(
              'asset/image/map1.png',
              height: 50,
            ),
            Height(6),
            SmallText(
              text:
                  'We use your location data only for the purpose of showing you '
                  'real-time distance and estimated time to pickup and deliver the orders, all the time, even when you\'re not using the app.',
              color: Colors.black,
              overFlow: TextOverflow.visible,
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(
                context,
              );
              errormsg();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(
                context,
              );
              requestPermissions();
            },
            child: const Text('Allow'),
          ),
        ],
      ),
    );
  }

  //   void showPermissionDisclosure() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Location Access Required'),
  //         content: Text(
  //           'In order to provide accurate pickup and delivery estimates, '
  //           'our app requires access to your device\'s location.\n\n'
  //           'We use your location data only for the purpose of showing you '
  //           'real-time distance and estimated time to pickup and deliver your orders.'
  //         ),
  //         actions: <Widget>[
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //               // You could also provide a button to open the app settings
  //             },
  //             child: Text('OK'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  void _checkLogedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final tkn = prefs.getString(AppConstants.TOKEN);
    if (tkn != null && tkn.isNotEmpty) {
      Get.offAllNamed(Routes.bottomNavigation);
    } else {
      Get.offAllNamed(Routes.intro);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AppAsset.logo,
            ),
            // fit: BoxFit.cover
          ),
        ),
      ),
    );
  }
}

class LocationPermission extends StatelessWidget {
  const LocationPermission({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SmallText(
            text: 'In order to provide accurate pickup and delivery estimates, '
                'our app requires access to your device\'s location.\n\n'
                'We use your location data only for the purpose of showing you '
                'real-time distance and estimated time to pickup and deliver customer orders.',
            color: Colors.black,
            overFlow: TextOverflow.visible,
          ),
        ],
      ),
    );
  }
}
