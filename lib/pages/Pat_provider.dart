import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class PatProvider extends StatefulWidget {
  const PatProvider({Key? key}) : super(key: key);

  @override
  _PatProviderState createState() => _PatProviderState();
}

class _PatProviderState extends State {
  //dosyaYolunu oluşturulması

  Future<String> get getDosyaYolu async {
    Directory dosya = await getApplicationDocumentsDirectory();
    return dosya.path;
  }

  //Dosyanın oluşturulması
  Future get dosyaOlustur async {
    var dosyakonumu = await getDosyaYolu;
    return File(dosyakonumu + "/myTXT.txt");
  }

  //dosyaya yazma işlemi
  Future dosyaYaz(String dosyaninIcerigi) async {
    var myDosya = await dosyaOlustur;
    return myDosya.writeAsString(dosyaninIcerigi);
  }

  //dosyayı okuma
  Future<String> okunacakDosya() async {
    try {
      var myDosya = await dosyaOlustur;

      String dosyaicergi = myDosya.readAsStringSync();
      return dosyaicergi;
    } catch (exception) {
      return "hata";
    }
  }

  //Form Field'dan Input alabilmemiz için controller yapısı
  TextEditingController mycontroller = TextEditingController();

  //Dosyaya yazılan veriyi ekranda gösterebilmek için gerekli degişken
  var gosterilecekDeger = "";

  //Snackbar'ı kullanabilmek için gerekli key
  GlobalKey? key = GlobalKey();

  @override
  Widget build(BuildContext context) {
//    Size size = MediaQuery.of(context).size;
    return Scaffold(
        key: key,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.grey.shade300,
          title: const Text(
            "Path Provider",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 3),
              child: TextField(
                controller: mycontroller,
                decoration: const InputDecoration(
                  fillColor: Colors.black12,
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _yaz,
                    child: const Text("Dosya'ya Yaz"),
                  ),
                  ElevatedButton(
                    onPressed: _oku,
                    child: const Text("Dosya'dan oku"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(gosterilecekDeger),
                ],
              ),
            ),
          ],
        ));
  }

  void _yaz() async {
    dosyaYaz(mycontroller.text.toString()).then((value) {
      setState(() {
        gosterilecekDeger = value.toString();
      });

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Başarıyla kaydedildi"),
        duration: Duration(seconds: 5),
      ));
    });
  }

  void _oku() async {
    okunacakDosya().then((String deger) {
      setState(() {
        gosterilecekDeger = deger;
        debugPrint(gosterilecekDeger);
      });
    });
  }
}
