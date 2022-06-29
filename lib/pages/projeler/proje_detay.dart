import 'package:fatih/model/proje_model.dart';
import 'package:flutter/material.dart';

class ProjeDetay extends StatefulWidget {
  const ProjeDetay({required this.projeModel, Key? key}) : super(key: key);
  final ProjeModel projeModel;

  @override
  _ProjeDetayState createState() => _ProjeDetayState();
}

class _ProjeDetayState extends State<ProjeDetay> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey.shade300,
        title: Text(
          widget.projeModel.name,
          style: const TextStyle(color: Colors.black),
        ),
      ),
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
                        height: size.height * 0.5 - 25,
                        width: size.height,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                        ),
                        child: Image.asset(widget.projeModel.photo, fit: BoxFit.fitWidth),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(horizontal: 42),
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 10),
                                blurRadius: 50,
                                color: Colors.red.withOpacity(0.23),
                              ),
                            ],
                          ),
                          child: ListTile(
                            //leading: FlutterLogo(size: 72.0),
                            title: Center(
                              child: Text(
                                widget.projeModel.name,
                                style: const TextStyle(fontSize: 24),
                              ),
                            ),
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.projeModel.aciklama,
                style: const TextStyle(fontSize: 18),
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
