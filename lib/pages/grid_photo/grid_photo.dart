import 'package:flutter/material.dart';

class GridPhoto extends StatefulWidget {
  const GridPhoto({Key? key}) : super(key: key);

  @override
  _GridPhotoState createState() => _GridPhotoState();
}

class _GridPhotoState extends State<GridPhoto> {
  List<String> myPhoto = [];

  @override
  void initState() {
    for (int i = 1; i < 13; i++) {
      myPhoto.add("asset/rep/$i.jpg");
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey.shade700,
        centerTitle: true,
        title: const Text("Fotoğraflarım"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: myPhoto.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Image.asset(
              myPhoto[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
      //yanlış kullanım

    );
  }
}
