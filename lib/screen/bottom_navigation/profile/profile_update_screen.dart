import 'dart:convert';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_clocare_delivery_boy/backend/api/staff_api.dart';
import 'package:new_clocare_delivery_boy/backend/logic/upload_recording_file.dart';
import 'package:new_clocare_delivery_boy/screen/auth/widgets/button_widget.dart';
import 'package:new_clocare_delivery_boy/screen/widget/circleBox.dart';
import 'package:new_clocare_delivery_boy/screen/widget/dropdown_button.dart';
import 'package:new_clocare_delivery_boy/screen/widget/share/size_box.dart';
import 'package:new_clocare_delivery_boy/screen/widget/show_custom_snackbar.dart';
import 'package:new_clocare_delivery_boy/screen/widget/small_text.dart';
import 'package:new_clocare_delivery_boy/screen/widget/text_field.dart';
import 'package:new_clocare_delivery_boy/utiles/app_constants.dart';
import 'package:new_clocare_delivery_boy/utiles/themes/ColorConstants.dart';
import 'package:path_provider/path_provider.dart';

class ProfileUpdateScreen extends StatefulWidget {
  final String name;
  final String imageUrl;
  final String emailId;

  const ProfileUpdateScreen(
      {super.key,
      required this.name,
      required this.imageUrl,
      required this.emailId});

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  StaffApi staffApi = StaffApi();
  FtpServerUpload ftpServerUpload = FtpServerUpload();
  TextEditingController nameController = TextEditingController();
  var emailController = TextEditingController();
  var selectIdProof = '';
  var idProof = ['Addhar Card', 'Driving licence', 'Voter id card'];
  String profileImage = '';
  File? _profileimage;
  File? _idProofimage;
  String userName = '';

  upload() {
    String name = nameController.text.trim();
    String emailId = emailController.text.trim();
    String idProof = selectIdProof;
    String idProofImage = _idProofimage.toString();

    if (name.isEmpty) {
      showCustomSnackBar(title: 'Name', 'Please enter your Name');
    } else if (emailId.isEmpty) {
      showCustomSnackBar(title: 'Email Id', 'Please enter your email id');
    } else if (!GetUtils.isEmail(emailId)) {
      showCustomSnackBar(title: 'Email Id', 'Please enter valid email id');
    } else if (idProof.isEmpty) {
      showCustomSnackBar(title: 'Id proof', 'Please select the id proof');
    } else if (_idProofimage == null) {
      showCustomSnackBar(
          title: 'Upload Id proof', 'Please upload the id proof photo');
    } else {
      print('Upload $idProofImage and ${_idProofimage}');
    }
  }

  // upload() {
  //   print('DDDDDDDDD $_idProofimage');
  //   // testCompressAndGetFile();
  //   // print('upload CALL $_idProofimage and $ff');
  //   // String recordingFilePath = '/root/cc.vcantech.ca/deliverImage/testing.text';
  //   // String ftpServer = '104.192.4.200';
  //   // String username = 'vcantech.ca';
  //   // String password = 'Yfg9z\$453';
  //   // String remotePath = '/';
  //   // ftpServerUpload.uploadRecoringFile(ftpServer, username, password, ff);
  // }

  Future<File?> compressImage(XFile imageFile) async {
    final compressedDirectory = await getTemporaryDirectory();
    final compressedFilePath =
        '${compressedDirectory.path}/compressed_image.jpg';
    final result = await FlutterImageCompress.compressAndGetFile(
      imageFile.path,
      compressedFilePath,
      quality: 50,
    );
    return result != null ? File(result.path) : null;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      nameController.text = widget.name;
      userName = widget.name.toString();
      emailController.text = widget.emailId;
      profileImage = widget.imageUrl.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 2,
          title: const Text(
            'Profile update',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Height(20),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 82,
                      child: CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.grey[300],
                          child: _profileimage != null
                              ? CircleAvatar(
                                  radius: 80,
                                  backgroundImage: _profileimage != null
                                      ? FileImage(_profileimage!)
                                      : null,
                                )
                              // ignore: unnecessary_null_comparison
                              : profileImage == null
                                  ? CircleAvatar(
                                      radius: 80,
                                      backgroundImage: NetworkImage(
                                          '${AppConstants.BASE_URL}/uploads/$profileImage'),
                                    )
                                  : CircleAvatar(
                                      radius: 80,
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Center(
                                            child: SmallText(
                                          text: userName[0],
                                          size: 45,
                                          color: Colors.white,
                                        )),
                                      ),
                                    )),
                    ),
                    Positioned(
                      right: 10,
                      bottom: 10,
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            color: AppColor.primaryButtonColor,
                            borderRadius: BorderRadius.circular(50)),
                        child: IconButton(
                          onPressed: () {
                            bottomSheetPage(context,
                                type: 'Upload profile photo');
                          },
                          icon: const Center(
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  hintText: 'Name',
                  icon: Icons.person,
                  controller: nameController,
                ),
                CustomTextField(
                  hintText: 'Email id',
                  icon: Icons.email,
                  controller: emailController,
                ),
                CustomDropDown(
                  // title: 'Services',
                  hintText: selectIdProof.isEmpty
                      ? 'Select Id proof to upload'
                      : selectIdProof,
                  hintColor:
                      selectIdProof.isEmpty ? Colors.black38 : Colors.black,
                  onChanged: (newValue) {
                    setState(() {
                      selectIdProof = newValue.toString();
                      // selectIdProof = newValue!['service_name'].toString();
                      // selectIdProofId = newValue['service_id'];
                      // getServiceTypeList(selectIdProofId);
                      // print(
                      //     'select services is $selectIdProof and $selectIdProofId');
                    });
                  },
                  items: idProof.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  icon: Icons.chrome_reader_mode_rounded,
                ),
                const Height(25),
                InkWell(
                  onTap: () {
                    print('Uploaf image');
                    bottomSheetPage(context, type: 'Upload Id proof photo');
                    // _getImageFromCamera();
                  },
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(15),
                    padding: const EdgeInsets.all(6),
                    dashPattern: const [4, 2],
                    color: AppColor.primaryColor1,
                    strokeWidth: 1,
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        // color: const Color.fromARGB(255, 243, 243, 243),
                        color: const Color.fromARGB(53, 132, 161, 242),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: _idProofimage != null
                            ? Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.file(
                                    _idProofimage!,
                                    // height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                  Container(
                                      height: 30,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            142, 243, 243, 243),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SmallText(
                                            text: 'Replace',
                                            size: 12,
                                            fontweights: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                          const Icon(Icons.edit,
                                              size: 10, color: Colors.black),
                                        ],
                                      )),
                                ],
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.camera_alt,
                                    color: AppColor.primaryColor1,
                                  ),
                                  const Height(5),
                                  SmallText(
                                    text: 'Upload Id proof',
                                    fontweights: FontWeight.w500,
                                    color: AppColor.primaryColor1,
                                  )
                                ],
                              ),
                      ),
                    ),
                  ),
                ),
                const Height(30),
                ButtonWidget(
                    text: 'Update',
                    backgroundColor: AppColor.primaryColor1,
                    onPressed: () {
                      // updateProfil();
                      upload();
                    }),
                const Height(30),
              ],
            ),
          ),
        ));
  }

  void bottomSheetPage(BuildContext context, {required String type}) {
    showModalBottomSheet(
        backgroundColor: Colors.black,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10),
          ),
        ),
        context: context,
        builder: (context) {
          return Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Height(20),
                Container(
                  height: 5,
                  width: 45,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 128, 128, 128),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                const Height(20),
                SmallText(
                  text: type,
                  size: 14,
                ),
                const Height(10),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleBox(
                          title: 'Camera',
                          tooltip: 'Upload Photos for Camera',
                          icon: const Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              _pickImage(ImageSource.camera, type);
                            });
                          }),
                      const SizedBox(
                        width: 55,
                      ),
                      CircleBox(
                          title: 'Gallery',
                          tooltip: 'Upload Photos for Gallery',
                          icon: const Icon(
                            Icons.photo_camera_back_outlined,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              _pickImage(ImageSource.gallery, type);
                            });
                          }),
                    ],
                  ),
                ),
                const Height(20),
              ],
            ),
          );
        });
  }

  Future _pickImage(ImageSource source, String type) async {
    try {
      final image = await ImagePicker().pickImage(
        source: source,
      );

      if (image == null) return;
      final img = File(image.path);
      final compressedImage = await compressImage(XFile(img.path));
      print(
          'uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu ${img.path.length} and ${compressedImage!.path.length}');
      List<int> imageBytes = await img.readAsBytes();
      List<int> imaa = await img.readAsBytes();
      String base64Image = base64Encode(imageBytes);
      String vv = base64Encode(imaa);
      print('uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuudd dd 1 ${base64Image}');
      print('uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuudd dd 2 ${vv}');
      setState(() {
        type == 'Upload profile photo'
            ? _profileimage = img
            : _idProofimage = img;
        Navigator.of(context).pop();
      });
    } on PlatformException catch (e) {
      print('failed to pick image: $e');
      Navigator.of(context).pop();
    }
  }
}
