import 'package:new_clocare_delivery_boy/backend/api/authendication_api.dart';
import 'package:new_clocare_delivery_boy/routes/routes_page.dart';
import 'package:new_clocare_delivery_boy/screen/auth/number_verify_screen.dart';
import 'package:new_clocare_delivery_boy/screen/auth/widgets/button_widget.dart';
import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/show_custom_snackbar.dart';
import 'package:new_clocare_delivery_boy/screen/widget/text_field.dart';
import 'package:new_clocare_delivery_boy/utiles/app_asset.dart';
import 'package:new_clocare_delivery_boy/utiles/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../backend/controller/profile_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthendicationApi authendicationApi = AuthendicationApi();

  bool isVisivalP = false;
  bool isVisivalC = false;
  bool isLoaded = false;
  bool checkedValue = false;

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  userLogin() async {
    final String userName = phoneController.text.trim();
    final String password = passwordController.text.trim();

    if (userName.isEmpty) {
      showCustomSnackBar( title: 'Login', 'Please your usrname and userName address');
    } else if (password.isEmpty) { showCustomSnackBar(title: 'Password', 'Please enter your password');
    } else {
      setState(() {
        isLoaded = true;
      });

      await authendicationApi.loginUser(userName, password).then((value) async {
        print('data and ${value.success} and ${value.data}');
        var st = value.data;
        print('data ${st!.status}');
        if (st.status == 'login') {
          setState(() {
            isLoaded = false;
          });

          String token = st.accessToken!;

          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(AppConstants.TOKEN, token);
          Get.find<ProfileController>().getProfileData();
          Get.toNamed(Routes.bottomNavigation);
        } else {
          showCustomSnackBar(title: 'Login', "Please enter correct credential");
          setState(() {
            isLoaded = false;
          });
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
                            'Welcome Back',
                            style: GoogleFonts.poppins(
                              color: const Color(0xff1D1617),
                              fontSize: size.height * 0.025,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
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
                      CustomTextField(
                          hintText: 'Password',
                          icon: Icons.lock_outline,
                          controller: passwordController,
                          obscureTexts: !isVisivalP,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isVisivalP = !isVisivalP;
                              });
                            },
                            icon: Icon(isVisivalP
                                ? Icons.visibility
                                : Icons.visibility_off_outlined),
                          )),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.015,
                          vertical: size.height * 0.025,
                        ),
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(Routes.forgotPassword);
                          },
                          child: Text(
                            "Forgot your password?",
                            style: TextStyle(
                              color: const Color(0xffADA4A5),
                              decoration: TextDecoration.underline,
                              fontSize: size.height * 0.02,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(17),
                        child: AnimatedPadding(
                          duration: const Duration(milliseconds: 500),
                          padding: EdgeInsets.only(top: size.height * 0.025),
                          // EdgeInsets.only(top: size.height * 0.085),
                          child: ButtonWidget(
                              text: "Login",
                              isLoding: isLoaded,
                              backgroundColor: AppColor.primaryColor1,
                              onPressed: () {
                                userLogin();
                              }),
                        ),
                      ),
                      AnimatedPadding(
                        duration: const Duration(milliseconds: 500),
                        padding: EdgeInsets.only(
                          top:
                              //  size.height * 0.025
                              size.height * 0.15,
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
                              text: "Don’t have an account yet? ",
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
                                              const NumberVerifyScreen()));
                                },
                                child: Text(
                                  "Register",
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
