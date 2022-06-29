import 'package:fatih/model/proje_model.dart';
import 'package:flutter/material.dart';

class FilmDetay extends StatefulWidget {
  const FilmDetay(
      {Key? key,
      required this.name,
      required this.photo,
      required this.aciklama})
      : super(key: key);
  final String name;
  final String photo;
  final String aciklama;

  @override
  _FilmDetayState createState() => _FilmDetayState();
}

class _FilmDetayState extends State<FilmDetay> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey.shade300,
        title: const Text(
          "Film Hakkında",
          style: TextStyle(color: Colors.black),
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
                        child: Hero(
                            tag: widget.name,
                            child: Image.asset(widget.photo,
                                fit: BoxFit.fitWidth)),
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
                            color: Colors.deepPurpleAccent,
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
                                widget.name,
                                style: const TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
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
                "Film Hakkında",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.aciklama,
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
