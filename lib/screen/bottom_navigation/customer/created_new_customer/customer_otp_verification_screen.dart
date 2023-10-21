import 'dart:async';
import 'package:new_clocare_delivery_boy/backend/api/customer_api.dart';
import 'package:new_clocare_delivery_boy/screen/auth/widgets/button_widget.dart';
import 'package:new_clocare_delivery_boy/screen/auth/widgets/otp_box.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/customer/created_new_customer/create_new_customer_screen.dart';
import 'package:new_clocare_delivery_boy/screen/widget/big_text.dart';
import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/show_custom_snackbar.dart';
import 'package:new_clocare_delivery_boy/screen/widget/small_text.dart';
import 'package:new_clocare_delivery_boy/utiles/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';

class CustomerVerificaionScreen extends StatefulWidget {
  final String number;
  const CustomerVerificaionScreen({
    Key? key,
    required this.number,
  }) : super(key: key);

  @override
  _VerificaionScreenState createState() => _VerificaionScreenState();
}

class _VerificaionScreenState extends State<CustomerVerificaionScreen> {
  bool verification = false;
  int _seconds = 60;
  Timer? _timer;

  CustomerApi customerApi = CustomerApi();

  var num1 = TextEditingController();
  var num2 = TextEditingController();
  var num3 = TextEditingController();
  var num4 = TextEditingController();
  var num5 = TextEditingController();
  var num6 = TextEditingController();
  String otpGet = '';

  numberVerify() {
    final String number = widget.number;
    customerApi.customerNumberVerificaion(number).then((value) {
      print("DDDDDDDDDD ${value.data!.status} ");
      if (value.data!.status == 'ok') {
        setState(() {
          otpGet = value.data!.verificationCode.toString();
        });
      }
    });
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_seconds == 0) {
            timer.cancel();
          } else {
            _seconds--;
          }
        },
      ),
    );
  }

  void resetTimer() {
    if (_seconds == 0) {
      if (_timer != null) {
        _timer!.cancel();
        _seconds = 60;
        startTimer();
        numberVerify();
      }
    } else {
      showCustomSnackBar(title: 'OTP', "please wait for 60 seconds");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    numberVerify();
    startTimer();
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.dispose();
  }

  numVerification() {
    final String myotp =
        num1.text + num2.text + num3.text + num4.text + num5.text + num6.text;
    print('nnnnnnnnnnnnnnnn $myotp and $otpGet');
    if (otpGet == myotp && myotp.isNotEmpty) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CreateNewCustomer(
                    mobileNumber: widget.number,
                  )));
    } else {
      showCustomSnackBar(title: 'OTP Code', 'Please enter valid opt code');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification'),
      ),
      body: Center(
        child: Container(
          height: size.height,
          width: size.height,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.02),
                        child: Align(
                          child: Text(
                            'Enter OTP',
                            style: GoogleFonts.poppins(
                              color: const Color(0xff1D1617),
                              fontSize: size.height * 0.02,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.015),
                        child: Align(
                            child: Text(
                          'Verification',
                          style: GoogleFonts.poppins(
                            color: const Color(0xff1D1617),
                            fontSize: size.height * 0.025,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.015),
                        child: Align(
                            child: SmallText(
                          text:
                              "An 4 Digit code has been sent to \n +91 ${widget.number} mobile number",
                          size: 14,
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.01),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: SizedBox(
                          height: 96,
                          child: Form(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                OtpBox(
                                  controller: num1,
                                ),
                                OtpBox(
                                  controller: num2,
                                ),
                                OtpBox(
                                  controller: num3,
                                ),
                                OtpBox(
                                  controller: num4,
                                ),
                                OtpBox(
                                  controller: num5,
                                ),
                                OtpBox(
                                  controller: num6,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Height(10),
                      BigText(
                        text: '$_seconds sec',
                        fontweights: FontWeight.w400,
                      ),
                      Height(20),
                      RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: "Didn't receive a OTP? ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                            WidgetSpan(
                              child: InkWell(
                                onTap: () {
                                  resetTimer();
                                },
                                child: Text(
                                  "Resend OTP",
                                  style: TextStyle(
                                    foreground: Paint()
                                      ..shader = const LinearGradient(
                                        colors: <Color>[
                                          // Color(0xffEEA4CE),
                                          // Color(0xffC58BF2),
                                          Color(0xFF174FA2), Color(0xFF57B1E3)
                                        ],
                                      ).createShader(
                                        const Rect.fromLTWH(
                                            0.0, 0.0, 200.0, 70.0),
                                      ),
                                    // color: const Color(0xffC58BF2),
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: AnimatedPadding(
                          duration: const Duration(milliseconds: 500),
                          padding: EdgeInsets.only(top: size.height * 0.085),
                          child: ButtonWidget(
                              text: "Verify",
                              backgroundColor: AppColor.primaryColor1,
                              onPressed: () {
                                setState(() {
                                  if (verification) {
                                    verification = false;
                                  } else {
                                    verification = true;
                                  }
                                });
                                numVerification();
                              }),
                        ),
                      ),
                      AnimatedPadding(
                        duration: const Duration(milliseconds: 500),
                        padding: EdgeInsets.only(
                          top: verification
                              ? size.height * 0.025
                              : size.height * 0.15,
                        ),
                        child: Row(
                          //TODO: replace text logo with your logo
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppAsset.logo,
                              height: 22,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool pwVisible = false;
  Widget buildTextField(
    String hintText,
    IconData icon,
    bool password,
    size,
    FormFieldValidator validator,
    Key key,
    int stringToEdit,
    bool isDarkMode,
  ) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.025),
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.08,
        decoration: const BoxDecoration(
          color: Color(0xffF7F8F8),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: TextField(
          style: const TextStyle(color: Colors.black),
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            errorStyle: const TextStyle(height: 0),
            hintStyle: const TextStyle(
              color: Color(0xffADA4A5),
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(
              top: size.height * 0.025,
            ),
            hintText: hintText,
            prefixIcon: Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.009,
              ),
              child: Icon(
                icon,
                color: const Color(0xff7B6F72),
              ),
            ),
            suffixIcon: Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.009,
              ),
              child: InkWell(
                onTap: () {
                  setState(() {
                    pwVisible = !pwVisible;
                  });
                },
                child: pwVisible
                    ? const Icon(
                        Icons.visibility_off_outlined,
                        color: Color(0xff7B6F72),
                      )
                    : const Icon(
                        Icons.visibility_outlined,
                        color: Color(0xff7B6F72),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> buildSnackError(
      String error, context, size) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.black,
        content: SizedBox(
          height: size.height * 0.02,
          child: Center(
            child: Text(error),
          ),
        ),
      ),
    );
  }
}
