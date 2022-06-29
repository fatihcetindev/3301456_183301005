import 'package:flutter/material.dart';

import '../login/login_page.dart';
import 'companent/items.dart';

class WhileStarting extends StatefulWidget {
  const WhileStarting({Key? key}) : super(key: key);

  @override
  _WhileStartingState createState() => _WhileStartingState();
}

class _WhileStartingState extends State<WhileStarting> {
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            controller: _pageViewController,
            itemCount: slides.length,
            itemBuilder: (BuildContext context, int index) {
              _pageViewController.addListener(() {
                setState(() {
                  currentPage = _pageViewController.page!;
                });
              });
              return slides[index];
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 70.0),
              padding: const EdgeInsets.symmetric(vertical: 80.0),
              child: buildGirisButton(context, currentPage),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 70.0),
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: indicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> slides = itemsList.map(
    (item) {
      return Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              //fit: FlexFit.tight,
              child: Image.asset(
                item['image'],
                fit: BoxFit.fitWidth,
                //width: 220.0,
                alignment: Alignment.bottomCenter,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: <Widget>[
                    Text(item['header'],
                        style: const TextStyle(
                            fontSize: 36.0,
                            fontWeight: FontWeight.w300,
                            color: Color(0XFF3F3D56),
                            height: 2.0)),
                    Text(
                      item['description'],
                      style: const TextStyle(
                          color: Colors.grey, letterSpacing: 1.2, fontSize: 24.0, height: 1.3),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    },
  ).toList();

  List<Widget> indicator() => List<Widget>.generate(
      slides.length,
      (index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 3.0),
            height: 10.0,
            width: 10.0,
            decoration: BoxDecoration(
                color: currentPage.round() == index
                    ? const Color(0XFF256075)
                    : const Color(0XFF256075).withOpacity(0.2),
                borderRadius: BorderRadius.circular(10.0)),
          ));

  double currentPage = 0.0;
  final _pageViewController = PageController();

  Widget buildGirisButton(BuildContext context, double currentPage) {
    if (currentPage.round() == itemsList.length - 1) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(35),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Login(),
              ),
            );
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.login),
              SizedBox(
                width: 10,
              ),
              Text("Devam Et"),
            ],
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.purpleAccent),
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
