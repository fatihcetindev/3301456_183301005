import 'package:animated_background/animated_background.dart';
import 'package:fatih/model/back_ground.dart';
import 'package:fatih/pages/gittigim_yerler/gittifim_yer_detay.dart';
import 'package:flutter/material.dart';

import '../../model/il.dart';

class GittigimYerler extends StatefulWidget {
  const GittigimYerler({Key? key}) : super(key: key);

  @override
  State<GittigimYerler> createState() => _GittigimYerlerState();
}

class _GittigimYerlerState extends State<GittigimYerler> {
  List<Il> iller = [
    Il(
      photo:
          "https://cdnuploads.aa.com.tr/uploads/Contents/2015/06/24/thumbs_b_c_75087620c3938656a24b4a12316b69a3.jpg",
      title: "Tokat",
      aciklama:
          "Tokat, Tokat ilinin merkez şehridir. Karadeniz Bölgesi'nde yer alan Tokat, kuzeyinde Samsun, kuzeydoğusunda Ordu, güney ve güneydoğusunda Sivas, güneybatısında Yozgat, batısında Amasya ile çevrilidir.",
    ),
    Il(
      photo:
          "https://i.haberglobal.com.tr/rcman/Cw1600h900q95gm/storage/files/images/2021/10/22/konya-9qWj.jpg",
      title: "Konya",
      aciklama:
          "Konya, Türkiye'nin yüzölçümü bakımından en büyük ili ve en kalabalık altıncı şehridir. 31 ilçeden oluşur.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey.shade300,
        title: const Text(
          "Gittiğim yerler",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Background(
        behaviour: RacingLinesBehaviour(),
        mychild: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: iller.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return GittigimDetay(detay: iller[index]);
                            },
                          ),
                        );
                      },
                      child: Mekan(
                        il: iller[index],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ), //,
    );
  }
}

class Mekan extends StatelessWidget {
  const Mekan({
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
        color: Colors.greenAccent[100],
        child: SizedBox(
          width: 300,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Hero(
                  tag: il.title,
                  child: CircleAvatar(
                    backgroundColor: Colors.green[500],
                    radius: 108,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(il.photo),
                      radius: 100,
                    ), //CircleAvatar
                  ),
                ), //CircleAvatar
                const SizedBox(
                  height: 10,
                ), //SizedBox
                Text(
                  il.title,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.green[900],
                    fontWeight: FontWeight.w500,
                  ), //Textstyle
                ), //Text
                const SizedBox(
                  height: 10,
                ), //SizedBox
                Text(
                  il.aciklama,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.green[900],
                  ), //Textstyle
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
