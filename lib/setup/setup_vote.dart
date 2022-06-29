import 'dart:convert';

import 'package:fatih/setup/setup_fail.dart';
import 'package:fatih/setup/setup_while_starting.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../model/read_saved_data_model.dart';
import 'shared_p_methods.dart';

class SetupVote extends StatefulWidget {
  const SetupVote({Key? key}) : super(key: key);

  @override
  State<SetupVote> createState() => _SetupVoteState();
}

class _SetupVoteState extends State<SetupVote> {
  late SharedPreferences readSavedData;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
        future: SharedPreferences.getInstance().then((data) => readSavedData = data),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const CircularProgressIndicator();
            default:
              if (snapshot.hasError) {
                return const CircularProgressIndicator(
                  color: Colors.red,
                );
              } else {
                return setupProces(readSavedData)!;
              }
          }
        },
      ),
    );
  }

  Widget? setupProces(SharedPreferences readSavedData) {
    String login = SharedPMethods.readSavedDataLogin(readSavedData);
    ReadSavedData rsdSavedData = SharedPMethods.readSavedDataFull(readSavedData);
    if ("null" == login) {
      return const WhileStarting();
    } else {
      String flagtokenTest = getTestUserNetwork(
        pswd: rsdSavedData.pswd.toString(),
        id: rsdSavedData.id.toString(),
      ).toString();

      if (flagtokenTest == "ok") {
        /* Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Vote(
            loginData: Logindata(
              id: rsdSavedData.id,
              ad: rsdSavedData.ad,
              soyad: rsdSavedData.soyad,
              mail: rsdSavedData.mail,
              icerdik1: rsdSavedData.icerik,
              kullaniciAdi: rsdSavedData.kullaniciAdi,
              pswd: rsdSavedData.pswd,
              tip: rsdSavedData.tip,
            ),
          ),
        ));*/
        //basarili ise giris yap
      } else {
        return const SetupFail();
      }
    }
  }

  static Future<String> getTestUserNetwork({required String pswd, required String id}) async {
    try {
      var tokenTest = await http.post(
        Uri.parse("s"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'id': "testid",
          'pswd': "admin",
        }),
      );
      if (tokenTest.statusCode == 200) {
        return tokenTest.body.toString();
      } else {
        return "veri yok";
      }
    } on Exception catch (e) {
      debugPrint("$e");
      return "veri yok";
    }
  }
}
