import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_clocare_delivery_boy/backend/api/staff_api.dart';
import 'package:new_clocare_delivery_boy/screen/auth/widgets/button_widget.dart';
import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/show_custom_snackbar.dart';
import 'package:new_clocare_delivery_boy/screen/widget/small_text.dart';
import 'package:new_clocare_delivery_boy/screen/widget/text_field.dart';
import 'package:new_clocare_delivery_boy/utiles/app_asset.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';

class ChangePasswordScreen extends StatefulWidget {
  ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  StaffApi staffApi = StaffApi();
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController cNewPassword = TextEditingController();
  bool isVisival1 = false;
  bool isVisival2 = false;
  bool isVisival3 = false;

  changePassword() async {
    String oldPass = oldPassword.text.trim();
    String newPass = newPassword.text.trim();
    String cNewPass = cNewPassword.text.trim();
    if (oldPass.isEmpty) {
      showCustomSnackBar(
          title: 'Old password', 'Please enter your old password');
    } else if (newPass.isEmpty) {
      showCustomSnackBar(
          title: 'New password', 'Please enter your new password');
    } else if (cNewPass.isEmpty) {
      showCustomSnackBar(
          title: 'Confirm new password', 'Please enter confirm new password');
    } else if (newPass != cNewPass) {
      showCustomSnackBar(
          title: 'Confirm new password',
          'Your confirm new password not match ');
    } else {
      await staffApi.changePassword(oldPass, newPass).then((value) {
        if (value.data!.status == "errors") {
          showCustomSnackBar(title: 'Error', value.data!.list![0].toString());
        } else if (value.data!.status == "ok") {
          // showCustomSnackBar(
          //     title: 'Password', value.data!.msg.toString());
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Password'),
              content: const Text('Password successfully changed'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, 'Cancel');
                    oldPassword.clear();
                    newPassword.clear();
                    cNewPassword.clear();
                  },
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
          showCustomSnackBar(title: 'Password', 'Password change successfully');
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
                      const Height(30),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.015),
                        child: Align(
                            child: Text(
                          'Change Password',
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
                          text: "Please enter your new password",
                          size: 14,
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.01),
                      ),
                      const Height(10),
                      CustomTextField(
                          hintText: 'New password',
                          icon: Icons.lock_outline,
                          controller: newPassword,
                          obscureTexts: !isVisival2,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isVisival2 = !isVisival2;
                              });
                            },
                            icon: Icon(isVisival2
                                ? Icons.visibility
                                : Icons.visibility_off_outlined),
                          )),
                      CustomTextField(
                          hintText: 'Confirm new password',
                          icon: Icons.lock_outline,
                          controller: cNewPassword,
                          obscureTexts: !isVisival3,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isVisival3 = !isVisival3;
                              });
                            },
                            icon: Icon(isVisival3
                                ? Icons.visibility
                                : Icons.visibility_off_outlined),
                          )),
                      const Height(20),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: AnimatedPadding(
                          duration: const Duration(milliseconds: 500),
                          padding: EdgeInsets.only(top: size.height * 0.085),
                          child: ButtonWidget(
                              text: "Change",
                              backgroundColor: AppColor.primaryColor1,
                              onPressed: () {
                          
                               changePassword();
                              }),
                        ),
                      ),
                      AnimatedPadding(
                        duration: const Duration(milliseconds: 500),
                        padding: EdgeInsets.only(top: size.height * 0.025),
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
}
