import 'package:flutter/material.dart';

class CustomDialogBox extends StatefulWidget {
  final String title;
  final String messages;
  final Function onPresseds;
  const CustomDialogBox({super.key, required this.title, required this.messages, required this.onPresseds});

  @override
  State<CustomDialogBox> createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:  Text(widget.title),
      content:  Text(widget.messages),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: ()=> widget.onPresseds(),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
