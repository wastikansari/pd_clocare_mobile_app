import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_clocare_delivery_boy/backend/controller/profile_controller.dart';
import 'package:new_clocare_delivery_boy/routes/routes_page.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/profile/about_screen.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/profile/helps_screen.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/profile/privacy_policy_screen.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/profile/profile_update_screen.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/profile/send_feedback_screen.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/profile/terms_and_conditions_screen.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/profile/update_password_screen.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/work/pending_deliveries/order_deliver_screen.dart';
import 'package:new_clocare_delivery_boy/screen/widget/big_text.dart';
import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/small_text.dart';
import 'package:new_clocare_delivery_boy/utiles/app_constants.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'notification_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileController profileController = Get.put(ProfileController());
  String name = '';
  String imageUrl = '';
  String emailId = '';
  void logout() async {
    profileController.clearUsers();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.get(AppConstants.TOKEN));

    prefs.remove(AppConstants.TOKEN);
    print(prefs.get(AppConstants.TOKEN));

    Get.offAllNamed(Routes.intro);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Profile',
            style: TextStyle(fontSize: 22),
          ),
          elevation: 1,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 130,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor2,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Obx(
                      () {
                        if (profileController.profile.value.success == null) {
                          return const CircularProgressIndicator();
                        } else if (profileController.profile.value.success ==
                            false) {
                          return const Text('Data retrieval failed.');
                        } else {
                          var userName ="${profileController.profile.value.data!.list!.first} ${profileController.profile.value.data!.list!.last}";
                          var phone = profileController.profile.value.data!.list!.username;
                          var images =profileController.profile.value.data!.list!.spic;
                          var email =profileController.profile.value.data!.list!.email;

                          name = userName;
                          imageUrl = images.toString();
                          emailId = email.toString();
                          return Row(
                            children: [
                              images == null
                                  ? CircleAvatar(
                                      radius: 55,
                                      backgroundColor: Colors.blueAccent,
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Center(
                                            child: SmallText(
                                          text: userName[0],
                                          size: 45,
                                          color: Colors.white,
                                        )),
                                      )
                                      //Text(nameAvatar, style:,),
                                      )
                                  : CircleAvatar(
                                      radius: 45,
                                      backgroundColor: Colors.white,
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage: NetworkImage(
                                            '${AppConstants.BASE_URL}/uploads/$images'
                                            // 'https://w7.pngwing.com/pngs/340/956/png-transparent-profile-user-icon-computer-icons-user-profile-head-ico-miscellaneous-black-desktop-wallpaper.png',
                                            ),
                                      ),
                                    ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BigText(
                                    text: userName,
                                    fontweights: FontWeight.w500,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                  const Height(5),
                                  BigText(
                                    text: phone.toString(),
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ],
                          );
                        }
                      },
                    ),
                  ),
                ),
                const Height(20),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      boxData(
                        title: 'Complet Order',
                        value: '0',
                        backgroundColor: Color.fromARGB(57, 255, 184, 77),
                      ),
                      Widths(8),
                      boxData(
                        value: '0',
                        title: 'Total Earning',
                        backgroundColor: Color.fromARGB(57, 255, 222, 77),
                      ),
                      Widths(8),
                      boxData(
                        title: 'Return Order',
                        value: '0',
                        backgroundColor: Color.fromARGB(57, 160, 77, 255),
                      )
                    ],
                  ),
                ),
                const Height(20),
                SmallText(
                  text: 'Account',
                  size: 22,
                  color: Colors.black,
                  fontweights: FontWeight.w600,
                ),
                const Height(5),
                CustumListTile(
                    title: 'Profile update',
                    onTap: () {
                      Get.to(ProfileUpdateScreen(
                        name: name,
                        imageUrl: imageUrl,
                        emailId: emailId,
                      ));
                    },
                    icon: const Icon(
                      Icons.person_pin_outlined,
                    )),
                CustumListTile(
                  title: "Change password",
                  icon: const Icon(Icons.password),
                  onTap: () {
                    Get.to(UpdatePasswordScreen());
                  },
                ),
                CustumListTile(
                  title: "Report To",
                  icon: const Icon(Icons.phone),
                  onTap: () {
                    // termCondition();
                  },
                ),

                const Height(30),
                SmallText(
                  text: 'Setting',
                  size: 22,
                  color: Colors.black,
                  fontweights: FontWeight.w600,
                ),
                const Height(5),
                CustumListTile(
                  title: "Notifications",
                  icon: const Icon(Icons.notifications),
                  onTap: () {
                    Get.to(const NotificationsScreen());
                  },
                ),

                // Height(5),
                CustumListTile(
                  title: 'Privacy Policy',
                  icon: const Icon(Icons.privacy_tip),
                  onTap: () {
                    Get.to(const PrivacyPolicyScreen());
                  },
                ),

                CustumListTile(
                  title: 'Send Feedback',
                  icon: const Icon(Icons.feedback),
                  onTap: () {
                    Get.to(const FeedbackScreen());
                  },
                ),

                CustumListTile(
                  title: "terms & Conditions",
                  icon: const Icon(Icons.text_format),
                  onTap: () {
                    Get.to(const TermsAndConditionsScreen());
                  },
                ),
                CustumListTile(
                  title: "About",
                  icon: const Icon(Icons.question_mark_outlined),
                  onTap: () {
                    Get.to(const AboutScreen());
                  },
                ),
                CustumListTile(
                  title: "Helps",
                  icon: const Icon(Icons.help_center),
                  onTap: () {
                    Get.to(const HelpsScreen());
                  },
                ),
                CustumListTile(
                  title: "Logout",
                  icon: const Icon(Icons.logout),
                  onTap: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Logout'),
                        content: const Text('Do you really wants to logout?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'No'),
                            child: const Text('No'),
                          ),
                          TextButton(
                            onPressed: () {
                              logout();

                              Navigator.pop(context, 'Yes');
                            },
                            child: const Text('Yes'),
                          ),
                        ],
                      ),
                    );
                  },
                ),

                const SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.center,
                  child: SmallText(
                    text: 'Clocare version 2.0.1',
                    color: Colors.grey,
                    fontweights: FontWeight.w500,
                    size: 11,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ));
  }
}

class boxData extends StatelessWidget {
  final String title;
  final String value;
  final Color backgroundColor;
  const boxData({
    super.key,
    required this.title,
    required this.value,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 120,
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 255, 255, 255),
            blurRadius: 1.0,
            spreadRadius: 1.0,
            offset: Offset(
              1.0,
              1.0,
            ),
          ),
        ],

        // color: backgroundColor,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: const Color.fromARGB(255, 221, 221, 221),
          style: BorderStyle.solid,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Column(
            children: [
              SmallText(
                text: value,
                color: AppColor.primaryColor1,
                fontweights: FontWeight.bold,
              ),
              const Height(5),
              SmallText(
                text: title,
                color: Colors.black,
                fontweights: FontWeight.w400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
