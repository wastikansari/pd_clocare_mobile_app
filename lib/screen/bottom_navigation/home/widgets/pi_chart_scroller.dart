import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/home/widgets/graphs/charts2.dart';
import 'package:new_clocare_delivery_boy/screen/bottom_navigation/home/widgets/graphs/pie_chart_circle.dart';


class PichartScroller extends StatefulWidget {
  const PichartScroller({super.key});

  @override
  State<PichartScroller> createState() => _PichartScrollerState();
}

class _PichartScrollerState extends State<PichartScroller> {
  PageController pageController = PageController();
  var _currPageValue = 0.0;

  final pichartlist = [
    const PieChartCircle(),
    const BarChartSample2(),
  ];

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 250,
          child: PageView.builder(
              controller: pageController,
              itemCount: 2,
              itemBuilder: (context, position) {
                return _buildPichart(position);
              }),
        ),
        const SizedBox(
          height: 10,
        ),
        DotsIndicator(
          dotsCount: 2,
          position: _currPageValue,
          decorator: const DotsDecorator(
                color: Colors.pink,
            activeColor: Colors.blue,
          ),
        ),
      ],
    );
  }

  Widget _buildPichart(int index) {
    return pichartlist[index];
  }
}
