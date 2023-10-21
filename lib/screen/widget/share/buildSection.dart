import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class BuildSection extends StatelessWidget {
  final String title;

  const BuildSection(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: theme.textTheme.subtitle1?.copyWith(
              fontWeight: FontWeight.w500, fontSize: 18, color: Colors.white),
        ),
        // MaterialButton(
        //   onPressed: () {},
        //   minWidth: 50,
        //   splashColor: theme.primaryColor.withAlpha(10),
        //   highlightColor: theme.primaryColor.withAlpha(30),
        //   shape:
        //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
        //   child: Icon(
        //     IconlyLight.arrow_right,
        //     size: 20,
        //     color: theme.primaryColor,
        //   ),
        // )
      ],
    );
  }
}
