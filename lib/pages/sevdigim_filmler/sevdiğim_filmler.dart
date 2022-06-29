import 'package:animated_background/animated_background.dart';
import 'package:fatih/model/back_ground.dart';
import 'package:fatih/pages/sevdigim_filmler/film_detay.dart';
import 'package:flutter/material.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

class SevdigimFilmler extends StatefulWidget {
  const SevdigimFilmler({Key? key}) : super(key: key);

  @override
  State<SevdigimFilmler> createState() => _SevdigimFilmlerState();
}

class _SevdigimFilmlerState extends State<SevdigimFilmler> {
  @override
  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      "Inception",
      "Interstellar",
      "LORD OF THE RİNGS",
      "Cars",
      "Inception.",
      "Interstellar.",
      "LORD OF THE RİNGS.",
      "Cars.",
    ];

    final List<String> imagesL = [
      "asset/filmler/1.png",
      "asset/filmler/2.jpg",
      "asset/filmler/3.jpg",
      "asset/filmler/4.jpg",
      "asset/filmler/1.png",
      "asset/filmler/2.jpg",
      "asset/filmler/3.jpg",
      "asset/filmler/4.jpg",
    ];

    final List<String> aciklama = [
      "Dom Cobb (Leonardo DiCaprio) çok yetenekli bir hırsızdır. Uzmanlık alanı, zihnin en savunmasız olduğu rüya görme anında, bilinçaltının derinliklerindeki değerli sırları çekip çıkarmak ve onları çalmaktır. Cobb’un bu ender mahareti, onu kurumsal casusluğun tehlikeli yeni dünyasında aranan bir oyuncu yapmıştır. Ancak, aynı zamanda bu durum onu uluslararası bir kaçak yapmış ve sevdiği her şeye mal olmuştur.Cobb’a içinde bulunduğu durumdan kurtulmasını sağlayacak bir fırsat sunulur. Ona hayatını geri verebilecek son bir iş; tabi eğer imkânsız “başlangıç”ı tamamlayabilirse. Mükemmel soygun yerine, Cobb ve takımındaki profesyoneller bu sefer tam tersini yapmak zorundadır; görevleri bir fikri çalmak değil onu yerleştirmektir. Eğer başarırlarsa, mükemmel suç bu olacaktır.",
      "Yakın bir gelecekte, tahıl ürünlerinin ölmesine neden olan bir küf yüzünden medeniyet gerileyerek tarım toplumu seviyesine düşmüştür. Dul bir mühendis ve eski bir NASA pilotu olan Joseph Cooper, ailesi ile birlikte bir tarla işletmektedir. O artık bir çiftçidir. 15 yaşında bir oğlu (Tom Cooper) ve 10 yaşında bir kızı (Murphy 'Murph' Cooper) vardır. Bir toz fırtınasından sonra, Murphy'nin yatak odasının zemininde açıklanamayacak şekilde garip toz desenleri belirir; anomaliyi bir hayalete bağlar.",
      "Yedisi taştan saraylarındaki cüce hükümdarlara, Dokuzu ölümlü insanlara, ölecekler ne yazık; Bir yüzük gölgeler içindeki Mordor Diyarı'nda, Kara tahtında oturan Karanlıklar Efendisi'ne. Hepsine hükmedecek bir yüzük, hepsini o bulacak, Hepsini bir araya getirip, karanlıkta birbirine bağlayacak, Gölgeler içindeki Mordor Diyarı'nda.",
      "Piston Kupa'sını almayı hedefleyen çaylak bir yarışçı, yolunu kaybederek Radyatör Kasabası'na gider. Bu çaylağın adı Şimşek McQueen'dir. Sally adında bir kadın arabaya (Porsche) âşık olur ve burada en iyi arkadaşı Çekici Mater'dır. En sonunda onu bulan taşıyıcı kamyonu onu yarışa götürür. Ama onu bekleyen kötü bir sürpriz vardır. Ekibi onu terk etmiştir. En sonunda da Radyatör Kasabası'nın sakinleri onun ekibi olur. Birinci olamamıştır fakat Kral adlı yarışçıya yardım ettiği için çok mutlu olmuştur. McQueen yarışta yaptığı bu davranış sonucunda herkesi kendine hayran bırakır.",
      "Dom Cobb (Leonardo DiCaprio) çok yetenekli bir hırsızdır. Uzmanlık alanı, zihnin en savunmasız olduğu rüya görme anında, bilinçaltının derinliklerindeki değerli sırları çekip çıkarmak ve onları çalmaktır. Cobb’un bu ender mahareti, onu kurumsal casusluğun tehlikeli yeni dünyasında aranan bir oyuncu yapmıştır. Ancak, aynı zamanda bu durum onu uluslararası bir kaçak yapmış ve sevdiği her şeye mal olmuştur.Cobb’a içinde bulunduğu durumdan kurtulmasını sağlayacak bir fırsat sunulur. Ona hayatını geri verebilecek son bir iş; tabi eğer imkânsız “başlangıç”ı tamamlayabilirse. Mükemmel soygun yerine, Cobb ve takımındaki profesyoneller bu sefer tam tersini yapmak zorundadır; görevleri bir fikri çalmak değil onu yerleştirmektir. Eğer başarırlarsa, mükemmel suç bu olacaktır.",
      "Yakın bir gelecekte, tahıl ürünlerinin ölmesine neden olan bir küf yüzünden medeniyet gerileyerek tarım toplumu seviyesine düşmüştür. Dul bir mühendis ve eski bir NASA pilotu olan Joseph Cooper, ailesi ile birlikte bir tarla işletmektedir. O artık bir çiftçidir. 15 yaşında bir oğlu (Tom Cooper) ve 10 yaşında bir kızı (Murphy 'Murph' Cooper) vardır. Bir toz fırtınasından sonra, Murphy'nin yatak odasının zemininde açıklanamayacak şekilde garip toz desenleri belirir; anomaliyi bir hayalete bağlar.",
      "Yedisi taştan saraylarındaki cüce hükümdarlara, Dokuzu ölümlü insanlara, ölecekler ne yazık; Bir yüzük gölgeler içindeki Mordor Diyarı'nda, Kara tahtında oturan Karanlıklar Efendisi'ne. Hepsine hükmedecek bir yüzük, hepsini o bulacak, Hepsini bir araya getirip, karanlıkta birbirine bağlayacak, Gölgeler içindeki Mordor Diyarı'nda.",
      "Piston Kupa'sını almayı hedefleyen çaylak bir yarışçı, yolunu kaybederek Radyatör Kasabası'na gider. Bu çaylağın adı Şimşek McQueen'dir. Sally adında bir kadın arabaya (Porsche) âşık olur ve burada en iyi arkadaşı Çekici Mater'dır. En sonunda onu bulan taşıyıcı kamyonu onu yarışa götürür. Ama onu bekleyen kötü bir sürpriz vardır. Ekibi onu terk etmiştir. En sonunda da Radyatör Kasabası'nın sakinleri onun ekibi olur. Birinci olamamıştır fakat Kral adlı yarışçıya yardım ettiği için çok mutlu olmuştur. McQueen yarışta yaptığı bu davranış sonucunda herkesi kendine hayran bırakır.",
    ];

    final List<Widget> images = [
      Padding(
        padding: const EdgeInsets.all(24.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Hero(
            tag: titles[0],
            child: Image.asset(
              "asset/filmler/1.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(24.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Hero(
            tag: titles[1],
            child: Image.asset(
              "asset/filmler/2.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(24.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Hero(
            tag: titles[2],
            child: Image.asset(
              "asset/filmler/3.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(24.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Hero(
            tag: titles[3],
            child: Image.asset(
              "asset/filmler/4.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(24.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Hero(
            tag: titles[4],
            child: Image.asset(
              "asset/filmler/1.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(24.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Hero(
            tag: titles[5],
            child: Image.asset(
              "asset/filmler/2.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(24.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Hero(
            tag: titles[6],
            child: Image.asset(
              "asset/filmler/3.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(24.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Hero(
            tag: titles[7],
            child: Image.asset(
              "asset/filmler/4.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    ];
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.grey.shade300,
          title: const Text(
            "Sevdiğim Filmler",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Background(
          behaviour: RectanglesBehaviour(),
          mychild: Column(
            children: <Widget>[
              Expanded(
                child: VerticalCardPager(
                    titles: titles,
                    images: images,
                    textStyle: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    // optional
                    onSelectedItem: (index) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return FilmDetay(
                              name: titles[index],
                              photo: imagesL[index],
                              aciklama: aciklama[index]);
                        },
                      ));
                      print(titles[index]);
                    },
                    initialPage: 0,
                    // optional
                    align: ALIGN.CENTER // optional
                    ),
              ),
            ],
          ),
        ));
  }
}
