import 'package:animated_background/animated_background.dart';
import 'package:fatih/model/back_ground.dart';
import 'package:flutter/material.dart';

import '../../model/il.dart';

class GittigimDetay extends StatelessWidget {
  const GittigimDetay({Key? key, required this.detay}) : super(key: key);
  final Il detay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey.shade300,
        title: const Text(
          "Seçili Şehir",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Background(
        behaviour: RacingLinesBehaviour(),
        mychild: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SingleChildScrollView(
                  child: MekanDetay(
                    il: detay,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MekanDetay extends StatelessWidget {
  const MekanDetay({
    Key? key,
    required this.il,
  }) : super(key: key);
  final Il il;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 50,
        shadowColor: Colors.black,
        color: Colors.orangeAccent[100],
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  il.title,
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ), //Textstyle
                ),
                const SizedBox(
                  height: 50,
                ),
                CircleAvatar(
                  backgroundColor: Colors.deepOrange[500],
                  radius: 108,
                  child: Hero(
                    tag: il.title,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(il.photo),
                      radius: 100,
                    ),
                  ), //CircleAvatar
                ), //CircleAvatar
                const SizedBox(
                  height: 20,
                ), //SizedBox

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    il.aciklama,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ), //Textstyle
                  ),
                ), //Text
                const SizedBox(
                  height: 10,
                ), //SizedBox
              ],
            ), //Column
          ), //Padding
        ), //SizedBox
      ),
    );
  }
}
