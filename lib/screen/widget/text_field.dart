import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData icon;
  bool? obscureTexts;
  final Widget? suffixIcon;
  TextInputType? keyboardType;

  CustomTextField(
      {super.key,
      required this.hintText,
      required this.icon,
      this.suffixIcon,
      required this.controller,
      this.obscureTexts = false,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
          keyboardType: keyboardType,
          obscureText: obscureTexts!,
          controller: controller,
          style: const TextStyle(color: Colors.black),
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              errorStyle: const TextStyle(height: 0),
              hintStyle: const TextStyle(
                color: Color(0xffADA4A5),
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(
                top: size.height * 0.028,
              ),
              hintText: hintText,
              prefixIcon: Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.010,
                ),
                child: Icon(
                  icon,
                  color: const Color(0xff7B6F72),
                ),
              ),
              suffixIcon: Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.010,
                ),
                child: suffixIcon,
              )),
        ),
      ),
    );
    ;
  }
}

class CustomTextFieldForm extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final IconData icon;
  final Widget? suffixIcon;
  final Widget? widget;
  final TextInputType? keyboardType;

  const CustomTextFieldForm(
      {super.key,
      required this.hintText,
      required this.icon,
      this.suffixIcon,
      this.controller,
      this.widget,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.020),
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.06,
        decoration: const BoxDecoration(
          color: Color(0xffF7F8F8),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                keyboardType: keyboardType,
                readOnly: widget == null ? false : true,
                autofocus: false,
                controller: controller,
                style: const TextStyle(color: Colors.black),
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(

                    // errorStyle: const TextStyle(height: 0),
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      color: Color(0xffADA4A5),
                    ),
                    border: InputBorder.none,
                    // contentPadding: EdgeInsets.only(
                    //   top: size.height * 0.028,
                    // ),
                    hintText: hintText,
                    prefixIcon: Icon(
                      icon,
                      color: const Color(0xff7B6F72),
                      size: 19,
                    ),
                    suffixIcon: suffixIcon),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: widget == null
                  ? Container()
                  : Expanded(
                      child: Container(
                        child: widget,
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
