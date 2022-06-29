import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../model/json_doviz.dart';
import '../../model/json_sinirsiz.dart';

class DolarApi extends StatefulWidget {
  const DolarApi({Key? key}) : super(key: key);

  @override
  State<DolarApi> createState() => _DolarApiState();
}

Future<JsonDoviz> dovizleriGetir() async {
  Map<String, String> userHeader = {
    "Content-type": "application/json",
    "authorization": "apikey 3Dpst9hIk1suXHcVrvoNuG:7MTnUFL6YdrLCVQsmYTrgM"
  };
  var response = await http.get(
      Uri.parse(
        "https://api.collectapi.com/economy/currencyToAll?int=10&base=USD",
      ),
      headers: userHeader);

  if (response.statusCode == 200) {
    try {
      return JsonDoviz.fromJson(jsonDecode(response.body));
    } on Exception {
      throw Exception("olmadı");
    }
  } else {
    throw Exception("olmadı");
  }
}

Future<JsonSinirsiz> dovizleriGetirSinirsiz() async {
  var response = await http.get(
    Uri.parse(
      "http://hasanadiguzel.com.tr/api/kurgetir",
    ),
  );
  print(response.body);
  if (response.statusCode == 200) {
    try {
      return JsonSinirsiz.fromJson(jsonDecode(response.body));
    } on Exception {
      throw Exception("olmadı");
    }
  } else {
    throw Exception("olmadı");
  }
}

class _DolarApiState extends State<DolarApi> {
  String dolar = "Kaç Doların var _? : 0";
  bool flag = true;
  @override
  void dispose() {
    flag= false;

    // TODO: implement dispose
    super.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    baslat();
  }

  baslat() {
    dovizleriGetirSinirsiz().then((value) {
      for (var birim in value.tCMBAnlikKurBilgileri!) {
        // print(birim.banknoteBuying);
        // print(birim.banknoteSelling);
        // print(birim.crossRateOther);
        // print(birim.crossRateUSD);
        // print(birim.banknoteBuying);
        if (birim.currencyName == "US DOLLAR") {
          print(birim.currencyName);
          print(birim.forexBuying);
          setState(() {
            dolar = birim.forexBuying.toString();
          });
        }
        // print(birim.forexSelling);
        // print(birim.isim);
      }
    });
    Future.delayed(const Duration(seconds: 5)).then((value) {
       if(flag){
         baslat();
       }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey.shade300,
        title: const Text(
          "Dolar Tl",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Text(dolar),
      ),
    );
  }
}
