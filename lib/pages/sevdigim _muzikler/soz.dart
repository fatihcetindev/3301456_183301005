import 'package:flutter/material.dart';

class Soz extends StatefulWidget {
  const Soz({required this.mysoz, Key? key}) : super(key: key);
  final String mysoz;

  @override
  State<Soz> createState() => _SozState();
}

class _SozState extends State<Soz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey.shade300,
        title: const Text(
          "Şarkının Sözleri",
          style: TextStyle(color: Colors.black, fontSize: 35),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
              child: Text(
            widget.mysoz,
            style: const TextStyle(fontSize: 24),
          )),
        ),
      ),
    );
  }
}
