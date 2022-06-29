import 'package:fatih/pages/sevdigim_twitler/tweet.dart';
import 'package:flutter/material.dart';

class TwettDetay extends StatelessWidget {
  const TwettDetay({Key? key, required this.widget}) : super(key: key);
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey.shade300,
        title: const Text(
          "Seçili Twit",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              child: widget,
            ),
          ],
        ),
      ),
    );
  }
}
