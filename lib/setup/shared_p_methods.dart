
import 'package:shared_preferences/shared_preferences.dart';

import '../model/read_saved_data_model.dart';

class SharedPMethods{
  static String readSavedDataLogin(SharedPreferences readSavedData) {
    ///tr
    // ilk kez mi giriş yapılıyor
    // == 0 ; ise evet
    ///en
    //first time logging in
    // == 0 ; yes
    return readSavedData.getString("login_screen") ?? "null";
  }

  static void deleteRSD() {
    late SharedPreferences readSavedData;
    SharedPreferences.getInstance().then((data) => readSavedData = data);
    readSavedData.remove("login_screen");
    readSavedData.remove("id");
    readSavedData.remove("ad");
    readSavedData.remove("soyad");
    readSavedData.remove("tip");
    readSavedData.remove("mail");
    readSavedData.remove("kullaniciAdi");
    readSavedData.remove("icerik1");
    readSavedData.remove("pswd");
  }

  static ReadSavedData readSavedDataFull(SharedPreferences readSavedData) {
    return ReadSavedData.build(
      login: readSavedData.getString("login_screen"),
      id: readSavedData.getString("id"),
      ad: readSavedData.getString("ad"),
      soyad: readSavedData.getString("soyad"),
      tip: readSavedData.getString("tip"),
      mail: readSavedData.getString("mail"),
      kullaniciAdi: readSavedData.getString("kullaniciAdi"),
      icerik: readSavedData.getString("icerik1"),
      pswd: readSavedData.getString("pswd"),
    );
  }
}