
import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  final FontWeight? fontweights;
  double size;
  TextOverflow overFlow;
  BigText({Key? key, this.color = Colors.black, required this.text , this.size=16, this.overFlow=TextOverflow.ellipsis, this.fontweights}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,      
      style: TextStyle(
        fontFamily:'VremenaGrotesk' ,
        fontSize: size,
        fontWeight: fontweights,
        color: color,

      ),
    );
    
  }
}