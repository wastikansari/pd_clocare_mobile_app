import 'package:new_clocare_delivery_boy/backend/api/authendication_api.dart';
import 'package:new_clocare_delivery_boy/screen/auth/login_screen.dart';
import 'package:new_clocare_delivery_boy/screen/auth/otp_screen.dart';
import 'package:new_clocare_delivery_boy/screen/auth/widgets/button_widget.dart';
import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/show_custom_snackbar.dart';
import 'package:new_clocare_delivery_boy/screen/widget/text_field.dart';
import 'package:new_clocare_delivery_boy/utiles/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';

class NumberVerifyScreen extends StatefulWidget {
  const NumberVerifyScreen({Key? key}) : super(key: key);

  @override
  _NumberVerifyScreenState createState() => _NumberVerifyScreenState();
}

class _NumberVerifyScreenState extends State<NumberVerifyScreen> {
  AuthendicationApi authendicationApi = AuthendicationApi();

  bool checkedValue = false;
  bool isLoading = false;

  TextEditingController phoneController = TextEditingController();

  userRegister() async {
    final String number = phoneController.text;

    if (number.isEmpty) {
      showCustomSnackBar( title: 'Mobile Number', 'Please enter your mobile number');
    } else if (!GetUtils.isPhoneNumber(number)) {
      showCustomSnackBar( title: 'Mobile Number', 'Please enter valid mobile number');
    } else if (checkedValue == false) {
      showCustomSnackBar( title: 'Term & Conditions', 'Plese check the Term and conditions');
    } else {
      setState(() {
        isLoading = true;
      });
      authendicationApi.numberCheck(number).then((value) {
        var data = value.data!;
        if (data.status == 'errors') {
          showCustomSnackBar(title: 'Mobile Number', "${data.msg}");
          setState(() {
            isLoading = false;
          });
        } else if (data.status == 'success') {
          setState(() {
            isLoading = false;
          });
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VerificaionScreen(
                      number: number, verify: 'register',
                    )),
          );
        } else {
          setState(() {
            isLoading = false;
          });
          showCustomSnackBar(
              title: 'Mobile Number', "Mobile number is invalid");
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
                            'Hey there,',
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
                          'Create an Account',
                          style: GoogleFonts.poppins(
                            color: const Color(0xff1D1617),
                            fontSize: size.height * 0.025,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.01),
                      ),
                      CustomTextField(
                        hintText: 'Mobile Number',
                        icon: Icons.phone,
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.015,
                            vertical: size.height * 0.025,
                          ),
                          child: CheckboxListTile(
                            title: RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        "By creating an account, you agree to our ",
                                    style: TextStyle(
                                      color: const Color(0xffADA4A5),
                                      fontSize: size.height * 0.015,
                                    ),
                                  ),
                                  WidgetSpan(
                                    child: InkWell(
                                      onTap: () {
                                        // ignore: avoid_print
                                        print('Conditions of Use');
                                      },
                                      child: Text(
                                        "Conditions of Use",
                                        style: TextStyle(
                                          color: const Color(0xffADA4A5),
                                          decoration: TextDecoration.underline,
                                          fontSize: size.height * 0.015,
                                        ),
                                      ),
                                    ),
                                  ),
                                  TextSpan(
                                    text: " and ",
                                    style: TextStyle(
                                      color: const Color(0xffADA4A5),
                                      fontSize: size.height * 0.015,
                                    ),
                                  ),
                                  WidgetSpan(
                                    child: InkWell(
                                      onTap: () {
                                        // ignore: avoid_print
                                        print('Privacy Notice');
                                      },
                                      child: Text(
                                        "Privacy Notice",
                                        style: TextStyle(
                                          color: const Color(0xffADA4A5),
                                          decoration: TextDecoration.underline,
                                          fontSize: size.height * 0.015,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            activeColor: const Color(0xff7B6F72),
                            value: checkedValue,
                            onChanged: (newValue) {
                              setState(() {
                                checkedValue = newValue!;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          )),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: AnimatedPadding(
                          duration: const Duration(milliseconds: 500),
                          padding: EdgeInsets.only(top: size.height * 0.085),
                          child: ButtonWidget(
                              text: "Register",
                              backgroundColor: AppColor.primaryColor1,
                              isLoding: isLoading,
                              onPressed: () {
                                userRegister();
                              }),
                        ),
                      ),
                      AnimatedPadding(
                        duration: const Duration(milliseconds: 500),
                        padding: EdgeInsets.only(
                          top: size.height * 0.15,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppAsset.logo,
                              height: 22,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Already have an account? ",
                              style: TextStyle(
                                color: const Color(0xff1D1617),
                                fontSize: size.height * 0.018,
                              ),
                            ),
                            WidgetSpan(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen()));
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    foreground: Paint()
                                      ..shader = const LinearGradient(
                                        colors: <Color>[
                                          Color(0xFF174FA2),
                                          Color(0xFF57B1E3)
                                        ],
                                      ).createShader(
                                        const Rect.fromLTWH(
                                            0.0, 0.0, 200.0, 70.0),
                                      ),
                                    // color: const Color(0xffC58BF2),
                                    fontSize: size.height * 0.018,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Height(40)
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
