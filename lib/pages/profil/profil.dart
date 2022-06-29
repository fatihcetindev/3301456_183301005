import 'package:fatih/pages/profil/hesap_makinesi.dart';
import 'package:fatih/pages/profil/iletisim.dart';
import 'package:flutter/material.dart';

import '../../final_controller.dart';
import 'widgets/yuzde.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: size.height * 0.5,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: size.height * 0.5 - 50,
                        width: size.height,
                        decoration: const BoxDecoration(
                          color: Colors.orangeAccent,
                        ),
                        child: Image.asset("asset/fatih.png",
                            fit: BoxFit.fitWidth),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(horizontal: 42),
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          height: 100,
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
                          child: const ListTile(
                            //leading: FlutterLogo(size: 72.0),
                            title: Text('Fatih ÇETİN'),
                            subtitle: Text('Monil Geliştirici'),
                            trailing: Icon(Icons.face),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Ben Kimim ?",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vel interdum ipsum. Nunc cursus erat placerat pulvinar ultricies. Donec placerat justo sit amet augue lacinia, nec venenatis diam fermentum. Maecenas finibus risus vitae diam bibendum interdum. Praesent iaculis, sapien nec pellentesque iaculis, massa nibh molestie felis, euismod convallis velit eros a eros. Suspendisse vel magna bibendum nulla hendrerit feugiat vitae ac mauris. Al",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return const Iletisim();
                        },
                      ));
                    },
                    child: const Text("İletişim")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return const HesapMakinesi();
                        },
                      ));
                    },
                    child: const Text("Hesap Makinesi")),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(thickness: 1, color: Colors.blue),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Center(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return const FinalController();
                          },
                        ));
                      },
                      child: Text("Final kısmına geçiş yap"))),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  Yuzde(
                      color: Colors.red,
                      name: "Flutter",
                      yuzde: 0.01,
                      yuzdeYazi: "1"),
                  Yuzde(
                      color: Colors.blue,
                      name: "Php",
                      yuzde: 0.54,
                      yuzdeYazi: "54"),
                  Yuzde(
                      color: Colors.purple,
                      name: "Java",
                      yuzde: 0.65,
                      yuzdeYazi: "65"),
                  Yuzde(
                      color: Colors.blue,
                      name: "Swift",
                      yuzde: 0.40,
                      yuzdeYazi: "40"),
                  Yuzde(
                      color: Colors.blueAccent,
                      name: "vue",
                      yuzde: 0.09,
                      yuzdeYazi: "9"),
                  Yuzde(
                      color: Colors.orange,
                      name: "JavaScript",
                      yuzde: 0.32,
                      yuzdeYazi: "32"),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
