import 'dart:math';

import 'package:flutter/material.dart';

class Tweet extends StatelessWidget {
  const Tweet(
      {Key? key,
      required this.user,
      required this.userHandle,
      required this.text})
      : super(key: key);

  final String user;
  final String userHandle;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
          color: Color.fromRGBO(21, 32, 43, 1.0),
          border: Border(bottom: BorderSide())),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            child: Text(user.substring(0, 1)),
          ),
          _tweetContent()
        ],
      ),
    );
  }

  String getrandom() {
    var rndm = Random();
    return rndm.nextInt(500).toString();
  }

  String getrandomtime() {
    var rndm = Random();
    return rndm.nextInt(60).toString();
  }

  Widget _tweetContent() {
    return Flexible(
      child: Container(
        margin: const EdgeInsets.only(left: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(user,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Container(
                  margin: const EdgeInsets.only(left: 5.0),
                  child: Text(userHandle + " · ${getrandomtime()}m",
                      style: TextStyle(color: Colors.grey[400])),
                )
              ],
            ),
            Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: Text(text, style: const TextStyle(color: Colors.white))),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Icon(Icons.message, color: Colors.white),
                      Container(
                        margin: const EdgeInsets.only(left: 3.0),
                        child: Text(getrandom(),
                            style: const TextStyle(color: Colors.white)),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(Icons.repeat, color: Colors.white),
                      Container(
                        margin: const EdgeInsets.only(left: 3.0),
                        child: Text(getrandom(),
                            style: const TextStyle(color: Colors.white)),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(Icons.favorite_border, color: Colors.white),
                      Container(
                        margin: const EdgeInsets.only(left: 3.0),
                        child: Text(getrandom(),
                            style: const TextStyle(color: Colors.white)),
                      )
                    ],
                  ),
                  const Icon(Icons.share, color: Colors.white)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
