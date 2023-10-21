import 'package:new_clocare_delivery_boy/backend/api/authendication_api.dart';
import 'package:new_clocare_delivery_boy/screen/auth/account_create_screen.dart';
import 'package:new_clocare_delivery_boy/screen/auth/login_screen.dart';
import 'package:new_clocare_delivery_boy/screen/auth/widgets/button_widget.dart';
import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/show_custom_snackbar.dart';
import 'package:new_clocare_delivery_boy/screen/widget/text_field.dart';
import 'package:new_clocare_delivery_boy/utiles/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';

class RegistrationScreen extends StatefulWidget {
  final String MobNumber;
  const RegistrationScreen({Key? key, required this.MobNumber})
      : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  AuthendicationApi authendicationApi = AuthendicationApi();

  bool isVisivalP = false;
  bool isVisivalC = false;
  bool isLoaded = false;
  bool checkedValue = false;
  bool register = false;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conformPasswordController = TextEditingController();

  userRegister() async {
    final String firstName = firstNameController.text.trim();
    final String lastName = lastNameController.text.trim();
    final String phoneNumber = widget.MobNumber;
    final String email = '';
    final String password = passwordController.text.trim();
    final String confirmPassword = conformPasswordController.text.trim();

    if (firstName.isEmpty) {
      showCustomSnackBar(title: 'First Name', 'Please enter your first name');
    } else if (lastName.isEmpty) {
      showCustomSnackBar(title: 'Last Name', 'Please enter your last name');
    } else if (password.isEmpty) {
      showCustomSnackBar(title: 'Password', 'Please enter your password');
    } else if (password.length < 6) {
      showCustomSnackBar(
          title: 'Password', "Passsword can't be less than 6 characters");
    } else if (confirmPassword.isEmpty) {
      showCustomSnackBar(
          title: 'Confirm Password', 'Enter your confirm password');
    } else if (password != confirmPassword) {
      showCustomSnackBar(
          title: 'Confirm Password',
          'The password confirmation does not match');
    } else {
      authendicationApi
          .registerUser(firstName, lastName, email, phoneNumber, password)
          .then((value) {
        print('ddddddddddddddddddddddddd ${value.data!.status}');
        if (value.data!.status == 'error') {
          showCustomSnackBar(title: 'Error', 'Mobile has already been taken.');
        } else {
          print('registrainon success');
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const SuccessScreen()),
              ((route) => false));
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
                        hintText: 'First Name',
                        icon: Icons.person_outlined,
                        controller: firstNameController,
                      ),
                      CustomTextField(
                        hintText: 'Last Name',
                        icon: Icons.person_outlined,
                        controller: lastNameController,
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
                                print(isVisivalP);
                              });
                            },
                            icon: Icon(isVisivalP
                                ? Icons.visibility
                                : Icons.visibility_off_outlined),
                          )),
                      CustomTextField(
                          hintText: 'Confirm Password',
                          icon: Icons.lock_outline,
                          controller: conformPasswordController,
                          obscureTexts: !isVisivalC,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isVisivalC = !isVisivalC;
                                print(isVisivalC);
                              });
                            },
                            icon: Icon(isVisivalC
                                ? Icons.visibility
                                : Icons.visibility_off_outlined),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: AnimatedPadding(
                          duration: const Duration(milliseconds: 500),
                          padding: register
                              ? EdgeInsets.only(top: size.height * 0.025)
                              : EdgeInsets.only(top: size.height * 0.085),
                          child: ButtonWidget(
                              text: "Register",
                                 backgroundColor: AppColor.primaryColor1,
                              isLoding: isLoaded,
                              onPressed: () {
                                userRegister();
                              }),
                        ),
                      ),
                      AnimatedPadding(
                        duration: const Duration(milliseconds: 500),
                        padding: EdgeInsets.only(
                          top: register
                              ? size.height * 0.025
                              : size.height * 0.15,
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
                      const Height(50)
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
