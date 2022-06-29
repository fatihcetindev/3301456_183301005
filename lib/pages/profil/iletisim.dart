import 'package:flutter/material.dart';

class Iletisim extends StatefulWidget {
  const Iletisim({Key? key}) : super(key: key);

  @override
  _IletisimState createState() => _IletisimState();
}

class _IletisimState extends State<Iletisim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade400,
        title: Text("İletişim"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Telefon :"),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("(+90) 534 922 14 87"),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Mail :"),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("fatih.cetin@coredinat.com"),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Adres :"),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Konya"),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("İnstgram :"),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("fat1hcetn"),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Facebook :"),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("fatih.cetin.5095"),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Github :"),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("fatihcetindev"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
