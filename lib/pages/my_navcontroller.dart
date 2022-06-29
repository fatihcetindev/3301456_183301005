import 'dart:async';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

import 'package:fatih/pages/profil/profil.dart';
import 'package:fatih/pages/projeler/projeler.dart';
import 'package:fatih/pages/rehber/rehber.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'grid_photo/grid_photo.dart';
import 'notlar/notlar.dart';

class MyNavcontroller extends StatefulWidget {
  const MyNavcontroller({Key? key}) : super(key: key);

  @override
  _MyNavcontrollerState createState() => _MyNavcontrollerState();
}

class _MyNavcontrollerState extends State<MyNavcontroller>
    with SingleTickerProviderStateMixin {
  var _bottomNavIndex = 0; //default index of a first screen

  late AnimationController _animationController;
  late Animation<double> animation;
  late CurvedAnimation curve;

  final iconList = <IconData>[
    Icons.pending_actions_outlined,
    Icons.account_balance_wallet_outlined,
    Icons.aspect_ratio,
    Icons.person_outline_outlined,
    Icons.comment,
  ];

  Widget pageSelect({required int index}) {
    if (index == 0) {
      return const Notlar();
    } else if (index == 1) {
      return const Projeler();
    } else if (index == 2) {
      return const GridPhoto();
    } else if (index == 3) {
      return const Profil();
    } else if (index == 4) {
      return const Rehber();
    }
    return const Center(child: Text("Erroorss"));
  }

  @override
  void initState() {
    super.initState();
    final systemTheme = SystemUiOverlayStyle.light.copyWith(
      //systemNavigationBarColor: HexColor('#ffffff'),
      systemNavigationBarIconBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(systemTheme);
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);

    Future.delayed(
      const Duration(seconds: 1),
      () => _animationController.forward(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: Scaffold(
        extendBody: true,
        body: pageSelect(index: _bottomNavIndex),
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: iconList.length,
          tabBuilder: (int index, bool isActive) {
            final color = isActive ? Colors.black : Colors.grey.shade700;
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  iconList[index],
                  size: 36,
                  color: color,
                ),
              ],
            );
          },
          backgroundColor: Colors.orange.shade300,
          activeIndex: _bottomNavIndex,
          splashColor: Colors.blue,
          notchAndCornersAnimation: animation,
          splashSpeedInMilliseconds: 300,
          notchSmoothness: NotchSmoothness.defaultEdge,
          gapLocation: GapLocation.none,
          leftCornerRadius: 50,
          rightCornerRadius: 50,
          onTap: (value) {
            setState(() {
              _bottomNavIndex = value;
            });
          },
        ),
      ),
    );
  }
}
