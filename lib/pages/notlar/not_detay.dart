import 'package:fatih/model/not_model.dart';
import 'package:flutter/material.dart';

class NotDetay extends StatefulWidget {
  const NotDetay({required this.notModel, Key? key}) : super(key: key);
  final NotModel notModel;

  @override
  _NotDetayState createState() => _NotDetayState();
}

class _NotDetayState extends State<NotDetay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey.shade300,
        title: const Text(
          "Söz:",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: Colors.blue.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Başlık :", style: TextStyle(fontSize: 16)),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(widget.notModel.baslik, style: const TextStyle(fontSize: 20)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.blue.shade100,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Söyleyen :", style: TextStyle(fontSize: 16)),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(widget.notModel.icerik, style: const TextStyle(fontSize: 20)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
