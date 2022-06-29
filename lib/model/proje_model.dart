class ProjeModel {
  ProjeModel({required this.aciklama, required this.name, required this.photo});

  String photo;
  String name;
  String aciklama;

  static List<ProjeModel> projetestList = [
    ProjeModel(aciklama: "Bu uygulamadır. Bir amaç içermez. Çoğu sayfası laf olsun diye yapılmıştır.", name: "Fatih", photo: "asset/clg1.png"),
    ProjeModel(aciklama: "Coredinat ziyaret sayısını %67, ciroyu %46, yeni müşteri sayısını %32 artıran baştan uca çözüm sunan bir pazarlamacı takip sistemidir.", name: "Coredinat", photo: "asset/coredinat.png"),
    ProjeModel(aciklama: "Köy Bilgi Sisteminin mobil uygulaması - 2023 proje ofisi", name: "Kbs", photo: "asset/kbs.png"),
    ProjeModel(aciklama: "Eğitim Tokat projesi yayında. Alt Projeler Kitap Tokat ve Etüt Tokat ilk olarak erişime açılmıştır.", name: "Egitim Tokat", photo: "asset/egitim.png"),
    ProjeModel(aciklama: "Evcil dostlarımızın merkezinde yer aldığı bir sosyal medya projesi", name: "Petsgram", photo: "asset/setup/2.png"),
    ProjeModel(aciklama: "Kendi uzay aracınızla yüksek hız, makas ve lazer atışları artık hayal değil! Space Traffic Racer, tüm bu adrenalini parmaklarınızın ucuna getiriyor.", name: "Space Trafic Racer", photo: "asset/spr.png"),
  ];
}
