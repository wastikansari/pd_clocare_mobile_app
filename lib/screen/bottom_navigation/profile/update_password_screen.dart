import 'package:flutter/material.dart';
import 'package:new_clocare_delivery_boy/backend/api/staff_api.dart';
import 'package:new_clocare_delivery_boy/screen/auth/widgets/button_widget.dart';
import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/show_custom_snackbar.dart';
import 'package:new_clocare_delivery_boy/screen/widget/text_field.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';

class UpdatePasswordScreen extends StatefulWidget {
  UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  StaffApi staffApi = StaffApi();
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController cNewPassword = TextEditingController();
  bool isVisival1 = false;
  bool isVisival2 = false;
  bool isVisival3 = false;

  changePassword() async{
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
    await  staffApi.changePassword(oldPass, newPass).then((value) {
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
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 2,
          title: const Text(
            'Change Password',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: Column(
            children: [
              CustomTextField(
                  hintText: 'Old password',
                  icon: Icons.password,
                  controller: oldPassword,
                  obscureTexts: !isVisival1,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isVisival1 = !isVisival1;
                      });
                    },
                    icon: Icon(isVisival1
                        ? Icons.visibility
                        : Icons.visibility_off_outlined),
                  )),
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
              const Height(60),
              ButtonWidget(
                  text: 'Change',
                  backgroundColor: AppColor.primaryColor1,
                  onPressed: () {
                    changePassword();
                  }),
            ],
          ),
        ));
  }
}
