import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
//import 'package:google_sign_in/google_sign_in.dart';

import '../constants/my_color.dart';
import '../pages/my_navcontroller.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  int a = 0;
  late AnimationController _controller;
  late SequenceAnimation _sequenceAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this);
    _sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
            animatable: AlignmentTween(
                begin: Alignment.topCenter, end: Alignment.bottomCenter),
            from: Duration.zero,
            to: const Duration(milliseconds: 600),
            tag: "MY_ALİGMENT_REGİSTER")
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from: Duration.zero,
            to: const Duration(milliseconds: 600),
            tag: "MY_OPACİTY_REGİSTER")
        .addAnimatable(
            animatable: ColorTween(begin: MyColor.orange, end: MyColor.white),
            from: const Duration(milliseconds: 400),
            to: const Duration(milliseconds: 1200),
            tag: "MY_GRADIEND")
        .addAnimatable(
            animatable: AlignmentTween(
                begin: Alignment.topCenter, end: Alignment.bottomCenter),
            from: const Duration(milliseconds: 200),
            to: const Duration(milliseconds: 800),
            tag: "MY_ALİGMENT_WİTH")
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from: const Duration(milliseconds: 200),
            to: const Duration(milliseconds: 800),
            tag: "MY_OPACİTY_WİTH")
        .addAnimatable(
            animatable: AlignmentTween(
                begin: Alignment.topCenter, end: Alignment.bottomCenter),
            from: const Duration(milliseconds: 400),
            to: const Duration(milliseconds: 1000),
            tag: "MY_ALİGMENT_LOGİN")
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from: const Duration(milliseconds: 400),
            to: const Duration(milliseconds: 1000),
            tag: "MY_OPACİTY_LOGİN")
        .addAnimatable(
            animatable: AlignmentTween(
                begin: Alignment.topCenter, end: Alignment.bottomCenter),
            from: const Duration(milliseconds: 600),
            to: const Duration(milliseconds: 1200),
            tag: "MY_ALİGMENT_PSWD")
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from: const Duration(milliseconds: 600),
            to: const Duration(milliseconds: 1200),
            tag: "MY_OPACİTY_PSWD")
        .addAnimatable(
            animatable: AlignmentTween(
                begin: Alignment.topCenter, end: Alignment.bottomCenter),
            from: const Duration(milliseconds: 800),
            to: const Duration(milliseconds: 1400),
            tag: "MY_ALİGMENT_USER")
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from: const Duration(milliseconds: 800),
            to: const Duration(milliseconds: 1400),
            tag: "MY_OPACİTY_USER")
        .addAnimatable(
            animatable: AlignmentTween(
                begin: Alignment.topCenter, end: Alignment.bottomCenter),
            from: const Duration(milliseconds: 1000),
            to: const Duration(milliseconds: 1600),
            tag: "MY_ALİGMENT_LOGO")
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from: const Duration(milliseconds: 1000),
            to: const Duration(milliseconds: 1600),
            tag: "MY_OPACİTY_LOGO")
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 250),
            from: const Duration(milliseconds: 1200),
            to: const Duration(milliseconds: 2000),
            tag: "MY_OPACİTY_BG1")
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 250),
            from: const Duration(milliseconds: 1800),
            to: const Duration(milliseconds: 2600),
            tag: "MY_OPACİTY_BG2")
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 250),
            from: const Duration(milliseconds: 2200),
            to: const Duration(milliseconds: 3000),
            tag: "MY_OPACİTY_BG3")
        .animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  TextEditingController mail = TextEditingController();
  TextEditingController sifre = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget? child) {
          return Stack(
            children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white,
                          _sequenceAnimation["MY_GRADIEND"].value
                        ]),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: _sequenceAnimation["MY_OPACİTY_BG1"].value - 250,
                child: Image.asset(
                  'asset/cbgd1.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: _sequenceAnimation["MY_OPACİTY_BG2"].value - 250,
                child: Image.asset(
                  'asset/cbgd2.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: _sequenceAnimation["MY_OPACİTY_BG3"].value - 250,
                child: Image.asset(
                  'asset/cbgd3.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              buildLogo(size),
              Opacity(
                opacity: (_sequenceAnimation["MY_OPACİTY_USER"].value),
                child: Align(
                  alignment: _sequenceAnimation["MY_ALİGMENT_USER"].value,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: size.height * 0.615),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        SizedBox(
                          width: 35,
                        ),
                        Text(
                          "Kullanıcı Adı",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              buildUser(size, mail),
              Opacity(
                opacity: (_sequenceAnimation["MY_OPACİTY_USER"].value),
                child: Align(
                  alignment: _sequenceAnimation["MY_ALİGMENT_USER"].value,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: size.height * 0.51),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        SizedBox(
                          width: 35,
                        ),
                        Text(
                          "Şifre",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              buildPswd(size, sifre),
              buildLogin(size, mail, sifre),
              Opacity(
                opacity: (_sequenceAnimation["MY_OPACİTY_LOGİN"].value),
                child: Align(
                  alignment: _sequenceAnimation["MY_ALİGMENT_LOGİN"].value,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: size.height * 0.31),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          "Şifreni unuttuysan mail at ",
                        ),
                        SizedBox(
                          width: 25,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Opacity(
                opacity: (_sequenceAnimation["MY_OPACİTY_LOGİN"].value),
                child: Align(
                  alignment: _sequenceAnimation["MY_ALİGMENT_WİTH"].value,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: size.height * 0.28),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "yada",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              buildWith(size),
              buildRegister(),
            ],
          );
        },
      ),
    );
  }

  Opacity buildLogo(Size size) {
    return Opacity(
      opacity: (_sequenceAnimation["MY_OPACİTY_LOGO"].value),
      child: Align(
        alignment: _sequenceAnimation["MY_ALİGMENT_LOGO"].value,
        child: Padding(
          padding: EdgeInsets.only(bottom: size.height * 0.63),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 3),
            child: Image.asset(
              'asset/clgtrnc.png',
              height: 200,
              width: size.width * 0.8,
            ),
          ),
        ),
      ),
    );
  }

  Opacity buildUser(Size size, TextEditingController tc) {
    return Opacity(
      opacity: (_sequenceAnimation["MY_OPACİTY_USER"].value),
      child: Align(
        alignment: _sequenceAnimation["MY_ALİGMENT_USER"].value,
        child: Padding(
          padding: EdgeInsets.only(bottom: size.height * 0.54),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 3),
            child: TextField(
              controller: tc,
              decoration: const InputDecoration(
                fillColor: Colors.black12,
                filled: true,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Opacity buildPswd(Size size, TextEditingController tc) {
    return Opacity(
      opacity: (_sequenceAnimation["MY_OPACİTY_PSWD"].value),
      child: Align(
        alignment: _sequenceAnimation["MY_ALİGMENT_PSWD"].value,
        child: Padding(
          padding: EdgeInsets.only(bottom: size.height * 0.44),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 3),
            child: TextField(
              controller: tc,
              decoration: const InputDecoration(
                fillColor: Colors.black12,
                filled: true,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Opacity buildLogin(
      Size size, TextEditingController mtc, TextEditingController ptc) {
    return Opacity(
      opacity: (_sequenceAnimation["MY_OPACİTY_LOGİN"].value),
      child: Align(
        alignment: _sequenceAnimation["MY_ALİGMENT_LOGİN"].value,
        child: Padding(
          padding: EdgeInsets.only(bottom: size.height * 0.34),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 3),
            child: GestureDetector(
              onTap: () async {
                bool flag = await girisyap(mail: mtc.text, sifre: ptc.text);
                if (flag) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const MyNavcontroller();
                    },
                  ));
                }
              },
              child: Container(
                height: size.width * 0.13,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [MyColor.blue, MyColor.darkBlue]),
                ),
                child: Center(
                  child: Text(
                    "Giriş Yap",
                    style: TextStyle(color: MyColor.white, fontSize: 22),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> girisyap({required String mail, required String sifre}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: mail, password: sifre);
      return true;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Opacity buildWith(Size size) {
    return Opacity(
      opacity: (_sequenceAnimation["MY_OPACİTY_WİTH"].value),
      child: Align(
        alignment: _sequenceAnimation["MY_ALİGMENT_WİTH"].value,
        child: Padding(
          padding: EdgeInsets.only(bottom: size.height * 0.20),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 3),
            child: GestureDetector(
              onTap: () async {
/*
                _gs.signIn().then((sonuc) {
                  sonuc?.authentication.then((googleKeys) {
                    AuthCredential credential = GoogleAuthProvider.credential(
                        idToken: googleKeys.idToken,
                        accessToken: googleKeys.accessToken);
                    _auth.signInWithCredential(credential).then((user) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return const MyNavcontroller();
                        },
                      ));
                    }).catchError((hata) {
                      print("burada");
                    });
                  }).catchError((hata) {
                    print("burada2");
                  });
                }).catchError((hata) {
                  print("burada3");
                });*/
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const MyNavcontroller();
                  },
                ));
              },
              child: Container(
                height: size.width * 0.12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: MyColor.blue,
                ),
                child: Center(
                  child: Text(
                    "Şimdilik Atla('Sudo -s')",
                    style: TextStyle(color: MyColor.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Opacity buildRegister() {
    return Opacity(
      opacity: (_sequenceAnimation["MY_OPACİTY_REGİSTER"].value),
      child: Align(
        alignment: _sequenceAnimation["MY_ALİGMENT_REGİSTER"].value,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Hala bir hesaba sahip değil misin ?"),
              const SizedBox(
                width: 2,
              ),
              Text(
                "Banane",
                // ee uygulama benim sonuçta :):):)
                style: TextStyle(color: MyColor.orange),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
