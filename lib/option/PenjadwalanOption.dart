// ignore: file_names
import 'package:uap_pbo/database/data.dart';

class PenjadwalanOption {
  String hari;
  DateTime waktuMulai;
  DateTime waktuSelesai;
  bool? isDone = false;

  Map<String, dynamic> checkIsFound(hari, waktuMulai, waktuSelesai) {
    bool isFound = false;
    PenjadwalanOption? penjadwalan;
    for (int i = 0; i < dataPenjadwalan.length; i++) {
      if (dataPenjadwalan[i].hari == hari &&
          dataPenjadwalan[i].waktuMulai == waktuMulai &&
          dataPenjadwalan[i].waktuSelesai == waktuSelesai) {
        isFound = true;
        penjadwalan = dataPenjadwalan[i];
        break;
      }
    }

    return {'isFound': isFound, 'penjadwalan': penjadwalan};
  }

  bool tambahData() {
    var isFound = checkIsFound(hari, waktuMulai, waktuSelesai);
    if (isFound['isFound'] == false) {
      dataPenjadwalan.add(this);
      print("Data Penjadwalan Berharil dibuat!");
      return true;
    } else {
      return false;
    }
  }

  PenjadwalanOption(
      {required this.hari,
      required this.waktuMulai,
      required this.waktuSelesai, this.isDone});
}
