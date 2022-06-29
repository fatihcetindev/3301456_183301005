import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Yuzde extends StatelessWidget {
  const Yuzde({
    required this.name,
    required this.color,
    required this.yuzde,
    required this.yuzdeYazi,
    Key? key,
  }) : super(key: key);
  final Color color;
  final String name;
  final String yuzdeYazi;
  final double yuzde;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, bottom: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadiusDirectional.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              spreadRadius: 0.4,
              blurRadius: 3,
              offset: const Offset(1, 2),
            )
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(name),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CircularPercentIndicator(
                radius: 48,
                lineWidth: 4.0,
                animation: true,
                percent: yuzde,
                center: Text(
                  yuzdeYazi + "%",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                circularStrokeCap: CircularStrokeCap.square,
                progressColor: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
