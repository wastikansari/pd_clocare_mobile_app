import 'package:get/get.dart';
import 'package:new_clocare_delivery_boy/backend/api/authendication_api.dart';
import 'package:new_clocare_delivery_boy/screen/auth/widgets/button_widget.dart';
import 'package:new_clocare_delivery_boy/screen/widget/show_custom_snackbar.dart';
import 'package:new_clocare_delivery_boy/screen/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utiles/themes/ColorConstants.dart';
import 'otp_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  AuthendicationApi authendicationApi = AuthendicationApi();
  String phone = '';
  bool isLoading = false;

  TextEditingController phoneController = TextEditingController();

  resetPassword() {
    String phone = phoneController.text;

    if (phone.isEmpty) {
      showCustomSnackBar(title: 'Mobile No', 'Please enter your mobile number');
    } else if (!GetUtils.isPhoneNumber(phone)) {
      showCustomSnackBar( title: 'Mobile Number', 'Please enter valid mobile number');
    } else {
          setState(() {
            isLoading = true;
          });
      authendicationApi.numberCheck(phone).then((value) {
        var data = value.data!;
        if (data.status == 'errors') {
          Get.to(VerificaionScreen(number: phone, verify: 'resetPassword'));
          setState(() {
            isLoading = false;
          });
        } else if (data.status == 'success') {
          setState(() {
            isLoading = false;
          });
          showCustomSnackBar(
              title: 'Mobile Number', "Mobile number is invalid");
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
    var isLoaded = false;
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
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.035, vertical: 25),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () => Navigator.pop(context),
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                                size: size.height * 0.03,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.015,
                              ),
                              child: Text(
                                'Back',
                                style: GoogleFonts.poppins(
                                  color: const Color(0xff1D1617),
                                  fontSize: size.height * 0.018,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          // top: size.height * 0.05,
                          left: size.width * 0.055,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Reset password',
                            style: GoogleFonts.poppins(
                              color: const Color(0xff1D1617),
                              fontSize: size.height * 0.035,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.055),
                        child: Align(
                          child: Text(
                            "Forgot your password? That's okay, it happens to everyone! Please enter your phone number to reset your password.",
                            style: GoogleFonts.poppins(
                              color: Colors.black54,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      CustomTextField(
                        hintText: 'Mobile number',
                        icon: Icons.phone,
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: AnimatedPadding(
                          duration: const Duration(milliseconds: 500),
                          padding: EdgeInsets.only(top: size.height * 0.025),
                          child: ButtonWidget(
                              text: "Verification",
                              backgroundColor: AppColor.primaryColor1,
                              isLoding: isLoading,
                              onPressed: () {
                                resetPassword();
                              }),
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
