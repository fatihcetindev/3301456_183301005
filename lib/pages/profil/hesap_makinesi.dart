import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HesapMakinesi extends StatefulWidget {
  const HesapMakinesi({Key? key}) : super(key: key);

  @override
  _HesapMakinesiState createState() => _HesapMakinesiState();
}

class _HesapMakinesiState extends State<HesapMakinesi> {
  final TextEditingController _textEditingController1 = TextEditingController();
  final TextEditingController _textEditingController2 = TextEditingController();
  String strVl = "Sonuç";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade400,
        title: const Text("Hesap Makinesi"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: _textEditingController1,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(4), labelText: "1.Sayı"),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: _textEditingController2,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(4), labelText: "2.Sayı"),
                  ),
                ),
              ),
            ],
          ),
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: const Text("+", style: TextStyle(fontSize: 30, color: Colors.black)),
                  onTap: () {
                    str(birinci: _textEditingController1, ikinci: _textEditingController2, typ: 1);
                  },
                ),
                GestureDetector(
                  child: const Text("-", style: TextStyle(fontSize: 30, color: Colors.black)),
                  onTap: () {
                    str(birinci: _textEditingController1, ikinci: _textEditingController2, typ: 2);
                  },
                ),
                GestureDetector(
                  child: const Text("*", style: TextStyle(fontSize: 30, color: Colors.black)),
                  onTap: () {
                    str(birinci: _textEditingController1, ikinci: _textEditingController2, typ: 3);
                  },
                ),
                GestureDetector(
                  child: const Text("/", style: TextStyle(fontSize: 30, color: Colors.black)),
                  onTap: () {
                    str(birinci: _textEditingController1, ikinci: _textEditingController2, typ: 4);
                  },
                ),
              ],
            ),
          ),
          Text(
            strVl,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24,),
          ),
        ],
      ),
    );
  }

  str(
      {required int typ,
      required TextEditingController ikinci,
      required TextEditingController birinci}) {
    setState(() {
      int val1 = int.tryParse(birinci.text) ?? 99999;
      int val2 = int.tryParse(ikinci.text) ?? 99999;
      if (val1 == 99999 || val2 == 9999) {
        strVl = "Sayıları doğru girdiğinize emin olunuz";
      } else if (typ == 1) {
        strVl = (val2 + val1).toString();
      } else if (typ == 2) {
        strVl = (val1 - val2).toString();
      } else if (typ == 3) {
        strVl = (val1 * val2).toString();
      } else if (typ == 4) {
        strVl = (val1 / val2).ceil().toString();
      }
    });
  }
}
