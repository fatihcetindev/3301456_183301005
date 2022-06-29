import 'package:flutter/material.dart';

import 'pages/Pat_provider.dart';
import 'pages/dolar_api/DolarApi.dart';
import 'pages/gittigim_yerler/gittigim_yerler.dart';
import 'pages/sevdigim _muzikler/sevdigim _muzikler.dart';
import 'pages/sevdigim_filmler/sevdiğim_filmler.dart';
import 'pages/sevdigim_twitler/sevdigim_twitler.dart';
import 'pages/wev_view_test.dart';

class FinalController extends StatefulWidget {
  const FinalController({Key? key}) : super(key: key);

  @override
  State<FinalController> createState() => _FinalControllerState();
}

class _FinalControllerState extends State<FinalController> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: const <Widget>[
          SevdigimFilmler(),
          SevdigimTewitler(),
          GittigimYerler(),
          SevdigimMuzik(),
          DolarApi(),
          PatProvider(),

        ],
      ),
    );
  }
}
