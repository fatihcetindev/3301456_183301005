import 'package:fatih/model/not_model.dart';

import 'package:fatih/pages/notlar/not_detay.dart';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../final_controller.dart';
import '../wev_view_test.dart';

class Notlar extends StatefulWidget {
  const Notlar({Key? key}) : super(key: key);

  @override
  _NotlarState createState() => _NotlarState();
}

class _NotlarState extends State<Notlar> {
  final TextEditingController _textEditingController = TextEditingController();
  List<NotModel> test = [
    NotModel(baslik: "'Her zaman umut vardır...'", icerik: "Aragorn"),
    NotModel(
        baslik:
            "Yaşayan pek çok kişi ölümü hak eder. Ölülerden bazıları da yaşamı. Yaşamı onlara verebilir misin? Ölüm hakkında karar vermekte aceleci olma. En bilgeler bile her sonucu bilemez'",
        icerik: "Gandalf"),
    NotModel(
        baslik:
            "Ben umut dolu sözler söyledim; ama sadece umut dolu. Umut, zafer demek değildir.'",
        icerik: "Gandalf"),
    NotModel(
        baslik:
            "'Zehirli dişi olmadıktan sonra yılan istediği yere gidebilir.'",
        icerik: "Ağaçsakal"),
    NotModel(
        baslik:
            "'Sabah verilen öğütler en iyisidir, gece birçok düşünceyi değiştirir.'",
        icerik: "Theoden"),
    NotModel(
        baslik:
            "Kafesten. Ta ki yaşlılıktan ve alışkanlıktan parmaklıklar ardını kabullenip, büyük işler başarma isteği hatırdan ve gönülden silininceye kadar parmaklıklar arkasında kalmaktan.'",
        icerik: "Eowyn"),
    NotModel(
        baslik:
            "'İçinizden en az yarısını arzuladığımın yarısı kadar bile tanımıyorum ve yarınızdan azını hak ettiğinizin ancak yarısı kadar sevebiliyorum.'",
        icerik: "Bilbo Bagins"),
    NotModel(
        baslik: "Yine de şafak hep insanların umudu olmuştur,..",
        icerik: "Aragorn"),
    NotModel(
        baslik:
            "'Sevgi sadakatle, cesaret itibarla, ihanet intikamla ödüllendirilir.'",
        icerik: "Denethor"),
    NotModel(
        baslik:
            "kafalar ne yapacaklarını bilemeyince iş bedenlere düşer diye bir laf vardır bizim memlekette",
        icerik: "Boramir"),
    NotModel(
        baslik: "'Umut doğar genellikle, her şey umutsuzlaştığında...'",
        icerik: "Legolas"),
    NotModel(
        baslik:
            "“İşin tam kıyısına, ümit ile ümitsizliğin kardeş olduğu yere geldik. Bundan böyle sendelemek düşmek demektir.”",
        icerik: "Aragorn"),
    NotModel(
        baslik: "Altın olan her şey parlamaz, her gezgin yitirmemiştir yolunu.",
        icerik: "Aragorn"),
    NotModel(
        baslik: "Kimsenin lütfuna olma tadip bedeli cevheri hürriyettir.",
        icerik: "Namık Kemal"),
    NotModel(
        baslik: "Köpektir zevk alan sayyad-ı bi insafa hizmetten.",
        icerik: "Namık Kemal"),
    NotModel(baslik: "Bu şehir girdap gülüm...", icerik: "Memati"),
    NotModel(
        baslik:
            "Hakkını helal et dememe bakma sen... Hayatını haram edene hak helal edilir mi hiç.",
        icerik: "T. Eliot"),
    NotModel(
        baslik:
            "Çünkü nasihat, bir bilgeden bir bilgeye verilecek olsa dahi tehlikeli bir armağandır ve her yol kötüye çıkabilir. Fakat ne bekliyordun ki?",
        icerik: "Gandalf"),
  ];
  List<NotModel>? notlar;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getNotlar().then((value) => notlar = value);
  }

  Future<List<NotModel>> getNotlar({int flag = 0}) async {
    if (notlar == null && flag != 0) {
      await Future.delayed(const Duration(seconds: 2));
      return test;
    } else {
      return test;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              // It will cover 20% of our total height
              height: size.height * 0.2,
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(
                      left: 8,
                      right: 8,
                      bottom: 42,
                    ),
                    height: size.height * 0.2 - 27,
                    decoration: const BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                        bottomRight: Radius.circular(36),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        const UstekiYazi(),
                        const SizedBox(
                          width: 20,
                        ),
                        const Icon(
                          Icons.star,
                          size: 36,
                          color: Colors.white,
                        ),
                        const Spacer(),
                        Image.asset("asset/clg1.png")
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 42),
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      height: 54,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 10),
                            blurRadius: 50,
                            color: Colors.red.withOpacity(0.23),
                          ),
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              onChanged: (value) {
                                setState(() {});
                                //buna gerek yok ahmet hocam :) Provider
                                //Provider.of<StateData>(context, listen: false).denme(value);
                              },
                              controller: _textEditingController,
                              decoration: InputDecoration(
                                hintText: "Arama",
                                hintStyle: TextStyle(
                                  color: Colors.teal.withOpacity(0.9),
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                // surffix isn't working properly  with SVG
                                // thats why we use row
                                // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                              ),
                            ),
                          ),
                          const Icon(Icons.search),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: (test.isNotEmpty)
                  ? ListView.builder(
                      itemCount: test.length,
                      itemBuilder: (context, index) {
                        if ((test[index].baslik.contains(
                                _textEditingController.text.toString()) ||
                            _textEditingController.text.toString() == "")) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32.0, vertical: 4),
                            child: Card(
                              child: ListTile(
                                title: Text(test[index].baslik),
                                trailing: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) {
                                          return NotDetay(
                                              notModel: test[index]);
                                        },
                                      ));
                                    },
                                    child: const Icon(Icons.send)),
                              ),
                            ),
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    )
                  : const Center(
                      child: Text("Yeni not yok abi"),
                    ), /**/
            ),
            /*Expanded(
              child: FutureBuilder(
                future: getNotlar(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<NotModel>> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const Center(child: CircularProgressIndicator());
                    default:
                      if (snapshot.hasError) {
                        return Center(
                            child: Text("Error ${snapshot.hasError}"));
                      } else {
                        if (snapshot.data == null) {
                          return const Center(child: Text("Yeni not yok abi"));
                        } else {
                          return (test.isNotEmpty)
                              ? ListView.builder(
                                  itemCount: test.length,
                                  itemBuilder: (context, index) {
                                    if ((test[index].baslik.contains(
                                            _textEditingController.text
                                                .toString()) ||
                                        _textEditingController.text
                                                .toString() ==
                                            "")) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 32.0, vertical: 4),
                                        child: Card(
                                          child: ListTile(
                                            title: Text(test[index].baslik),
                                            trailing: GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context)
                                                      .push(MaterialPageRoute(
                                                    builder: (context) {
                                                      return NotDetay(
                                                          notModel:
                                                              test[index]);
                                                    },
                                                  ));
                                                },
                                                child: const Icon(Icons.send)),
                                          ),
                                        ),
                                      );
                                    } else {
                                      return const SizedBox();
                                    }
                                  },
                                )
                              : const Center(
                                  child: Text("Yeni not yok abi"),
                                );
                        }
                      }
                  }
                },
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}

class UstekiYazi extends StatefulWidget {
  const UstekiYazi({
    Key? key,
  }) : super(key: key);

  @override
  State<UstekiYazi> createState() => _UstekiYaziState();
}

class _UstekiYaziState extends State<UstekiYazi> {
  int flagfinal = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        (flagfinal == 0)
            ? "Sevdiğim Sözler"
            : (flagfinal == 1)
                ? "Final kısmına geç"
                : (flagfinal == 2)
                    ? "Test Web Wiev"
                    : "Error",
        /* (flagfinal == 0)
            ? "Sevdiğim Sözler"
            : (flagfinal == 1)
                ? "Sevdigim fimler"
                : (flagfinal == 2)
                    ? "Sevdiğim Twitler"
                    : (flagfinal == 3)
                        ? "Gittiğim Yerler"
                        : (flagfinal == 4)
                            ? "Sevdiğim Müzikler"
                            : (flagfinal == 5)
                                ? "Dolar api"
                                : (flagfinal == 6)
                                    ? "Final Kısmına geç"
                                    : "Eror",*/
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 24,
        ),
      ),
      onDoubleTap: () {
        setState(() {
          //if (flagfinal != 6) {
          if (flagfinal != 2) {
            flagfinal++;
          } else {
            flagfinal = 0;
          }
        });
      },
      onLongPress: () {
        if (flagfinal == 1) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return const FinalController();
            },
          ));
        }else if(flagfinal == 2) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return const WebWievTest();
            },
          ));
        }
        /*  if (flagfinal == 0) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return const FinalController();
            },
          ));
        } else if (flagfinal == 1) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return const SevdigimFilmler();
            },
          ));
        } else if (flagfinal == 2) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return const SevdigimTewitler();
            },
          ));
        } else if (flagfinal == 3) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return const GittigimYerler();
            },
          ));
        } else if (flagfinal == 4) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return const SevdigimMuzik();
            },
          ));
        } else if (flagfinal == 5) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return const DolarApi();
            },
          ));
        } else if (flagfinal == 6) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return const FinalController();
            },
          ));
        }*/
      },
    );
  }
}
