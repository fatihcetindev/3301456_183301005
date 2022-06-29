import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';

class Background extends StatefulWidget {
  final Widget mychild;
  final Behaviour behaviour;

  const Background({
    Key? key,
    required this.behaviour,
    required this.mychild,
  }) : super(key: key);

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    print("object");
    //her sayfanın arkasinda bulanacak olan arkaplan animasyonu için widget tasarımı
    return Stack(
      children: [
        AnimatedBackground(
            behaviour: widget.behaviour, vsync: this, child: widget.mychild),
      ],
    );
  }
}
