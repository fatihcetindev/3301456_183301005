import 'package:fatih/setup/setup_vote.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

import '../../constants/my_color.dart';
import '../../constants/my_string.dart';

class Beginning extends StatefulWidget {
  const Beginning({Key? key}) : super(key: key);

  @override
  _BeginningState createState() => _BeginningState();
}

class _BeginningState extends State<Beginning> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late SequenceAnimation _sequenceAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this);
    _sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
            animatable: AlignmentTween(begin: Alignment.center, end: Alignment.centerLeft),
            from: Duration.zero,
            to: const Duration(milliseconds: 300),
            tag: "MY_ALİGMENT")
        .addAnimatable(
            animatable: Tween<double>(begin: 2, end: 8),
            from: const Duration(seconds: 0),
            to: const Duration(milliseconds: 300),
            tag: "MY_SİZE")
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from: const Duration(milliseconds: 500),
            to: const Duration(seconds: 1),
            tag: "MY_OPACİTY")
        .addAnimatable(
            animatable: AlignmentTween(begin: Alignment.centerLeft, end: Alignment.topLeft),
            from: const Duration(seconds: 1),
            to: const Duration(milliseconds: 1500),
            tag: "MY_ALİGMENT")
        .addAnimatable(
            animatable: AlignmentTween(begin: Alignment.center, end: Alignment.topCenter),
            from: const Duration(seconds: 1),
            to: const Duration(milliseconds: 1500),
            tag: "MY_ALİGMENT_TEXT")
        .addAnimatable(
            animatable: ColorTween(begin: MyColor.darkBlue, end: MyColor.white),
            from: const Duration(seconds: 1),
            to: const Duration(milliseconds: 1500),
            tag: "colorDarkBlue")
        .addAnimatable(
            animatable: ColorTween(begin: MyColor.blue, end: MyColor.orange),
            from: const Duration(seconds: 1),
            to: const Duration(milliseconds: 1500),
            tag: "colorBlue")
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from: const Duration(seconds: 1),
            to: const Duration(milliseconds: 1500),
            tag: "MY_OPACİTY_R")
        .animate(_controller);

    _controller.forward();

    _controller.addStatusListener((status) {
      if (_controller.isCompleted) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const SetupVote(),
        ));
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          _sequenceAnimation["colorDarkBlue"].value,
                          _sequenceAnimation["colorBlue"].value
                        ])),
                  ),
                ),
                Align(
                  alignment: _sequenceAnimation["MY_ALİGMENT_TEXT"].value,
                  child: Opacity(
                    opacity: 1.0 - _sequenceAnimation["MY_OPACİTY_R"].value,
                    child: Opacity(
                      opacity: (_sequenceAnimation["MY_OPACİTY"].value),
                      child: SizedBox(
                        height: size.width * 0.2,
                        child: Row(
                          children: [
                            SizedBox(
                              width: size.width * 0.3,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  MyString.fatiharge,
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: MyColor.white,
                                  ),
                                ),
                                SizedBox(
                                  height: size.width * 0.02,
                                ),
                                Text(
                                  MyString.powerOfCetinCompany,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: MyColor.orange,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: _sequenceAnimation["MY_ALİGMENT"].value,
                  child: Opacity(
                    opacity: 1.0 - _sequenceAnimation["MY_OPACİTY_R"].value,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Image.asset(
                        MyString.lg1,
                        width: size.width * ((10 - _sequenceAnimation["MY_SİZE"].value) / 10.0),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
