import 'package:fatih/constants/my_color.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse(
    'https://music.youtube.com/watch?v=gJdnCn00Wn0&list=RDAMVM0Vr96IRLv7U');

class Rehber extends StatefulWidget {
  const Rehber({Key? key}) : super(key: key);

  @override
  _RehberState createState() => _RehberState();
}

class _RehberState extends State<Rehber> {
  List<Map<String, dynamic>> _items = [];

  final _mybox = Hive.box('my_box');

  @override
  void initState() {
    super.initState();
    _guncelle();
  }

  void _guncelle() {
    final data = _mybox.keys.map((key) {
      final value = _mybox.get(key);
      return {"key": key, "isim": value["isim"], "numara": value['numara']};
    }).toList();

    setState(() {
      _items = data.reversed.toList();
    });
  }

  Future<void> _yeniEkle(Map<String, dynamic> newItem) async {
    await _mybox.add(newItem);
    _guncelle();
  }

  Future<void> _updateItem(int itemKey, Map<String, dynamic> item) async {
    await _mybox.put(itemKey, item);
    _guncelle(); // Update the UI
  }

  Future<void> _seciliSil(int itemKey) async {
    await _mybox.delete(itemKey);
    _guncelle();

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Seçili Kişi silindi')));
  }

  final TextEditingController _isimController = TextEditingController();
  final TextEditingController _numuraController = TextEditingController();
  double x = 15;




    void _ekleFormModalBottom(BuildContext mycontext, int? itemKey) async {

    if (itemKey != null) {
      final flag = _items.firstWhere((element) {
        return element['key'] == itemKey;
      });
      _isimController.text = flag['isim'];
      _numuraController.text = flag['numara'];
    }

    showModalBottomSheet(
        context: mycontext,
        elevation: 5,
        builder: (_) => Container(
              padding: EdgeInsets.only(bottom: x, top: 15, left: 15, right: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    onTap: () {
                      x = 200;
                    },
                    onEditingComplete: () {
                      x = 15;
                    },
                    controller: _isimController,
                    decoration: const InputDecoration(hintText: 'isim :'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    onTap: () {
                      x = 200;
                    },
                    onEditingComplete: () {
                      x = 15;
                    },
                    controller: _numuraController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: 'Numara : '),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (itemKey == null) {
                        _yeniEkle({
                          "isim": _isimController.text,
                          "numara": _numuraController.text
                        });
                      }

                      if (itemKey != null) {
                        _updateItem(itemKey, {
                          'isim': _isimController.text.trim(),
                          'numara': _numuraController.text.trim()
                        });
                      }
                      _isimController.text = '';
                      _numuraController.text = '';

                      Navigator.of(context).pop();
                    },
                    child: const Text("Ekle/güncelle"),
                  ),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            ));
  }

  void _launchUrl() async {
    if (!await launchUrl(_url)) throw 'Derdini s$_url';
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _items.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Rehberde kimsen Yok - Yalnız kurt ',
                      style: TextStyle(fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        //print("object");
                        _launchUrl();
                      },
                      child: const Text(
                          'https://music.youtube.com/watch?v=0Vr96IRLv7U&list=RDAMVM0Vr96IRLv7U',
                          textAlign: TextAlign.center),
                    ),
                  ],
                ),
              ),
            )
          : ListView.builder(
              // the list of items
              itemCount: _items.length,
              itemBuilder: (_, index) {
                final currentItem = _items[index];
                return Card(
                  color: MyColor.orange.withAlpha(131),
                  margin: const EdgeInsets.all(16),
                  elevation: 8,
                  child: ListTile(
                      title: Text(currentItem['isim']),
                      subtitle: Text(currentItem['numara'].toString()),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                _ekleFormModalBottom(context, currentItem['key']);
                              }),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              _seciliSil(currentItem['key']);
                            },
                          ),
                        ],
                      )),
                );
              }),
      // Add new item button
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: FloatingActionButton(
          onPressed: () {
            _ekleFormModalBottom(context, null);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
