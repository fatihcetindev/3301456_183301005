import 'package:fatih/model/proje_model.dart';
import 'package:fatih/pages/projeler/proje_detay.dart';
import 'package:flutter/material.dart';

class Projeler extends StatefulWidget {
  const Projeler({Key? key}) : super(key: key);

  @override
  _ProjelerState createState() => _ProjelerState();
}

class _ProjelerState extends State<Projeler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey.shade700,
        centerTitle: true,
        title: const Text("Projelerim"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: ProjeModel.projetestList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return ProjeDetay(
                    projeModel: ProjeModel.projetestList[index],
                  );
                },
              ));
            },
            child: Card(
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Image.asset(
                      ProjeModel.projetestList[index].photo,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Center(child: Text(ProjeModel.projetestList[index].name)),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
