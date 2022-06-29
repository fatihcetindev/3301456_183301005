import 'package:animated_background/animated_background.dart';
import 'package:fatih/model/back_ground.dart';
import 'package:fatih/pages/sevdigim_twitler/tweet.dart';
import 'package:fatih/pages/sevdigim_twitler/twit_detay.dart';
import 'package:flutter/material.dart';

class SevdigimTewitler extends StatefulWidget {
  const SevdigimTewitler({Key? key}) : super(key: key);

  @override
  State<SevdigimTewitler> createState() => _SevdigimTewitlerState();
}

class _SevdigimTewitlerState extends State<SevdigimTewitler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey.shade300,
        title: const Text(
          "Sevdiğim Twitler",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Background(
        behaviour: SpaceBehaviour(),
        mychild: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _buildBody(context),
        ),
      ),
    );
  }
}

Widget _buildBody(context) {
  List<Tweet> _tweets = [
    const Tweet(
        user: "Kitap Penceresi",
        userHandle: "kitappencere",
        text: "Dünyadaki en korkunç şey, ümidini kaybetmektir."),
    const Tweet(
        user: "hic etik degil",
        userHandle: "hicetikdegil",
        text: "Gözündeki ne abi? \n\n -fâr abi"),
    const Tweet(
        user: "Behzat Ç.",
        userHandle: "BehzatC",
        text: "uğruna üzüldüğümüz insanlar,\nbaşkalarıyla çok mutlular."),
    const Tweet(
        user: "Kuzey Güney",
        userHandle: "kuzeyguney",
        text: "bu hayat bize başrol vermedi"),
    const Tweet(
        user: "İnci Sözlük",
        userHandle: "incisozluk",
        text:
            "ateri ördeği vurduğumuzu nasıl anlıyodu lan \n\nlan oğlum hadi ateri anladı, peki ya o ****** köpeği nasıl anlıyordu ördeğin öldüğünü, hemen koşup alıp geliyordu, bide pis pis gülüyordu sanki. "),
    const Tweet(
        user: "Elon Musk",
        userHandle: "elonmusk",
        text:
            "Original Top Gun is a great movie. Just rewatched. Looking forward to seeing the sequel."),
    const Tweet(user: "Fatih Çetin", userHandle: "-----", text: "HAHA"),
  ];

  return Column(
    children: <Widget>[
      Flexible(
        child: ListView.builder(
          itemBuilder: (_, int index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return TwettDetay(
                      widget: _tweets[index],
                    );
                  },
                ));
              },
              child: _tweets[index],
            ),
          ),
          itemCount: _tweets.length,
          reverse: false,
        ),
      ),
      Container(
        decoration: BoxDecoration(color: Theme.of(context).cardColor),
        child: _buildTabsBar(context),
      ),
    ],
  );
}

Widget _buildTabsBar(context) {
  return Container(
    height: 60,
    color: const Color.fromRGBO(21, 32, 43, 1.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Icon(Icons.home, color: Theme.of(context).colorScheme.secondary),
        Icon(Icons.search, color: Colors.grey[100]),
        Icon(Icons.notifications_none, color: Colors.grey[100]),
        Icon(Icons.mail_outline, color: Colors.grey[100])
      ],
    ),
  );
}
