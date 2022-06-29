import 'dart:math';

import 'package:animated_background/animated_background.dart';
import 'package:fatih/model/back_ground.dart';
import 'package:fatih/pages/sevdigim%20_muzikler/soz.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../model/muzik.dart';

class SevdigimMuzik extends StatefulWidget {
  const SevdigimMuzik({Key? key}) : super(key: key);

  @override
  State<SevdigimMuzik> createState() => _SevdigimMuzikState();
}

class _SevdigimMuzikState extends State<SevdigimMuzik> {
  List<Muzik> mList = [
    Muzik(
        soz: "O gözler benim, ağlar"
            "\nEskisinden yabancı"
            "\nGöynümdeki bu sevda"
            "\nHiç dinmeyen bir acı"
            "\n\nRuhumun kederinden"
            "\nGözlerim yaşla doldu"
            "\nİnliyorum derinden"
            "\nBana bilmem ne oldu"
            "\n\nEn candan arkadaşım"
            "\nRuhumu saran gece"
            "\nBen kime bağlanmışım"
            "\nAğlıyorum gizlice"
            "\n\nKimsesiz karanlıklar"
            "\nDerdime şifa verin"
            "\nKalbimdeki yaralar"
            "\nDaha çok, daha derin",
        name: "Hasret",
        url:
            "https://music.youtube.com/watch?v=ITEfghyt1sQ&list=RDAMVMITEfghyt1sQ"),
    Muzik(
        soz: "Yalnızım geceden yalnız"
            "\nYalnızım zamansız"
            "\nUmudum yok, vaktim dar"
            "\nGönlümde bitmez arzular",
        name: "Yalnızım",
        url:
            "https://music.youtube.com/watch?v=BXGX8tGGdZY&list=RDAMVM0Vr96IRLv7U"),
    Muzik(
        soz: "Uykusuz gecelerin sabahını bana sor"
            "\nYarım kalan aşkımın acısnı bana sor"
            "\nUykusuz gecelerin sabahını bana sor"
            "Y\narım kalan aşkımın acısnı bana sor",
        name: "Bana Sor",
        url:
            "https://music.youtube.com/watch?v=gJdnCn00Wn0&list=RDAMVM0Vr96IRLv7U"),
    Muzik(
        soz: "Sanki terk edilmiş bir viraneyim"
            "\nHer yanım dağılmış, yıkılmışım ben"
            "\nÜstüne basılan taşlar misali",
        name: "Yıkılmışım Ben",
        url:
            "https://music.youtube.com/watch?v=zu0yoW6HVf4&list=RDAMVM0Vr96IRLv7U"),
    Muzik(
        name: "Bu Şehir Girdap Gülüm",
        url:
            "https://music.youtube.com/watch?v=KZ9I4btqqGQ&list=RDAMVM0Vr96IRLv7U"),
    Muzik(
        name: "Demir Attım",
        url:
            "https://music.youtube.com/watch?v=aW8Hf7mOmBg&list=RDAMVM0Vr96IRLv7U"),
    Muzik(
        name: "Tükeneceğiz",
        url:
            "https://music.youtube.com/watch?v=TxVrosLTcnQ&list=RDAMVM0Vr96IRLv7U"),
    Muzik(
        name: "Sen Affetsen",
        url:
            "https://music.youtube.com/watch?v=iYuP1n8Ihdk&list=RDAMVM0Vr96IRLv7U"),
    Muzik(
        name: "Öyle bir yerdeyim ki",
        url:
            "https://music.youtube.com/watch?v=uC_qV3rqKZk&list=RDAMVM0Vr96IRLv7U"),
    Muzik(
        name: "Bir Ay Doğar",
        url:
            "https://music.youtube.com/watch?v=f77DRgfKSEM&list=RDAMVM0Vr96IRLv7U"),
    Muzik(
      soz: "Duman",
        name: "Ah",
        url:
            "https://music.youtube.com/watch?v=tydOZk0KDRo&list=RDAMVM0Vr96IRLv7U"),
    Muzik(
        soz: "O gözler benim, ağlar"
            "\nEskisinden yabancı"
            "\nGöynümdeki bu sevda"
            "\nHiç dinmeyen bir acı"
            "\n\nRuhumun kederinden"
            "\nGözlerim yaşla doldu"
            "\nİnliyorum derinden"
            "\nBana bilmem ne oldu"
            "\n\nEn candan arkadaşım"
            "\nRuhumu saran gece"
            "\nBen kime bağlanmışım"
            "\nAğlıyorum gizlice"
            "\n\nKimsesiz karanlıklar"
            "\nDerdime şifa verin"
            "\nKalbimdeki yaralar"
            "\nDaha çok, daha derin"
            "O gözler benim, ağlar"
            "\nEskisinden yabancı"
            "\nGöynümdeki bu sevda"
            "\nHiç dinmeyen bir acı"
            "\n\nRuhumun kederinden"
            "\nGözlerim yaşla doldu"
            "\nİnliyorum derinden"
            "\nBana bilmem ne oldu"
            "\n\nEn candan arkadaşım"
            "\nRuhumu saran gece"
            "\nBen kime bağlanmışım"
            "\nAğlıyorum gizlice"
            "\n\nKimsesiz karanlıklar"
            "\nDerdime şifa verin"
            "\nKalbimdeki yaralar"
            "\nDaha çok, daha derin"
            "O gözler benim, ağlar"
            "\nEskisinden yabancı"
            "\nGöynümdeki bu sevda"
            "\nHiç dinmeyen bir acı"
            "\n\nRuhumun kederinden"
            "\nGözlerim yaşla doldu"
            "\nİnliyorum derinden"
            "\nBana bilmem ne oldu"
            "\n\nEn candan arkadaşım"
            "\nRuhumu saran gece"
            "\nBen kime bağlanmışım"
            "\nAğlıyorum gizlice"
            "\n\nKimsesiz karanlıklar"
            "\nDerdime şifa verin"
            "\nKalbimdeki yaralar"
            "\nDaha çok, daha derin",
        name: "Gamzedeyim Deva bulmam",
        url:
            "https://music.youtube.com/watch?v=fnD64yCKULI&list=RDAMVM0Vr96IRLv7U"),
  ];

  Color getColor() {
    var rndom = Random();
    int a = rndom.nextInt(8);
    if (a == 0) {
      return const Color(0xFF00f9d7);
    } else if (a == 1) {
      return const Color(0xFF9af0a2);
    } else if (a == 2) {
      return const Color(0xFF580484);
    } else if (a == 3) {
      return const Color(0xFFb43082);
    } else if (a == 4) {
      return const Color(0xFFee7487);
    } else if (a == 5) {
      return const Color(0xFFe7c136);
    } else if (a == 6) {
      return const Color(0xFFd9dd74);
    } else if (a == 7) {
      return const Color(0xFF1f6ed8);
    } else {
      return const Color(0xFF67ae3a);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey.shade300,
        title: const Text(
          "En Sevdiğim Müzikler",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Background(
        behaviour: BubblesBehaviour(),
        mychild: SafeArea(
          child: ListView.builder(
            itemCount: mList.length,
            itemBuilder: (context, index) {
              return buildContainer(
                  sarkisozu: mList[index].soz,
                  name: mList[index].name,
                  url: Uri.parse(mList[index].url));
            },
          ),
        ),
      ),
    );
  }

  void _launchUrl(Uri url) async {
    if (!await launchUrl(url)) throw 'asdsa surl';
  }

  Container buildContainer(
      {required String name, required String sarkisozu, required Uri url}) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: 100,
      decoration: BoxDecoration(
        color: getColor().withAlpha(150),
        borderRadius: BorderRadius.circular(10.0),
        // the box shawdow property allows for fine tuning as aposed to shadowColor
        boxShadow: const [
          BoxShadow(
              color: Color(0xFFFFAFBD),
              // offset, the X,Y coordinates to offset the shadow
              offset: Offset(0.0, 10.0),
              // blurRadius, the higher the number the more smeared look
              blurRadius: 10.0,
              spreadRadius: 1.0)
        ],
      ),
      child: Row(
        children: [
          const Expanded(
            flex: 3,
            child: Center(
              child: Icon(Icons.music_note),
            ),
          ),
          Expanded(
            flex: 9,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return Soz(mysoz: sarkisozu);
                  },
                ));
              },
              child: Container(
                height: 100,
                color: Colors.blue.withAlpha(50),
                child: Center(child: Text(name)),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.white60,
              child: Center(
                  child: IconButton(
                      onPressed: () {
                        print("tiklandı");
                        _launchUrl(url);
                      },
                      icon: const Icon(Icons.label_important_outline_rounded))),
            ),
          ),
        ],
      ),
    );
  }
}
