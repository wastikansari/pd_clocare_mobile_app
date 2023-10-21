import 'package:flutter/material.dart';
import 'package:new_clocare_delivery_boy/screen/auth/login_screen.dart';
import 'package:new_clocare_delivery_boy/screen/auth/number_verify_screen.dart';
import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';
import 'package:url_launcher/url_launcher.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 2, 43, 104),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 100, left: 15, right: 15, bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'asset/image/clocare-logo-white-blue.png',
                  height: 60,
                ),
                Image.asset(
                  'asset/image/delivery_boy.png',
                  height: 400,
                ),
                Column(
                  children: [
                    Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        //AppColor.primaryColor2,
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.primaryColor1,
                            blurRadius: 1.0,
                            spreadRadius: 1.0,
                            offset: const Offset(
                              1.0,
                              1.0,
                            ),
                          ),
                        ],
                        border: Border.all(color: AppColor.primaryColor1),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      // decoration: BoxDecoration(
                      //   color: AppColor.primaryColor2,
                      //   border: Border.all(
                      //     color: Color.fromARGB(255, 81, 81, 81),
                      //     width: 1.0,
                      //   ),
                      //   borderRadius: BorderRadius.circular(10.0),
                      // ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: const Text(
                          "Get started",
                          style: TextStyle(
                            color: Color.fromARGB(255, 2, 43, 104),
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Don’t have an account yet? ",
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: size.height * 0.019,
                                fontWeight: FontWeight.w500),
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
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColor.primaryColor2,
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
                                    fontSize: size.height * 0.019,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Height(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialIcon(
                          icon: 'asset/image/linkedin.png',
                          colors: Colors.blue,
                          onTap: () async {
                            await launch(
                                "https://www.linkedin.com/company/clocareindia/");
                          },
                        ),
                        SocialIcon(
                          icon: 'asset/image/insta.png',
                          colors: Colors.orange,
                          onTap: () async {
                            await launch(
                                "https://www.instagram.com/clocareindia/");
                          },
                        ),
                        SocialIcon(
                          icon: 'asset/image/facebook.png',
                          colors: Color.fromARGB(255, 60, 89, 151),
                          onTap: () async {
                            await launch(
                                "https://www.instagram.com/clocareindia/");
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

class SocialIcon extends StatelessWidget {
  final String icon;
  final Color colors;
  final Function onTap;
  const SocialIcon(
      {super.key,
      required this.icon,
      required this.colors,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          padding: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
              shape: BoxShape.circle, border: Border.all(color: colors)
              // borderRadius: BorderRadius.circular(10)
              // color: Color.fromARGB(53, 87, 172, 242).withOpacity(0.5),
              ),
          child: Image.asset(
            icon,
            height: 13,
          )

          // Icon(
          //   icon,
          //   color: Colors.white,
          //   size: 20.0,
          // ),
          ),
    );
  }
}
