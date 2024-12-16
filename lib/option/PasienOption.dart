import 'package:uap_pbo/database/data.dart';
import 'package:uap_pbo/option/PenjadwalanOption.dart';

class PasienOption {
  String nama;
  int umur;

  Map<String, dynamic> checkIsFound(nama) {
    bool isFound = false;
    PasienOption? pasien;
    for (int i = 0; i < dataPasien.length; i++) {
      if (dataPasien[i].nama == nama) {
        isFound = true;
        pasien = dataPasien[i];
        break;
      }
    }

    return {'isFound': isFound, 'pasien': pasien};
  }

  dynamic searchDokter(nama) {
    var isFound = checkIsFound(nama);
    if (isFound['isFound'] == true) {
      return {'pasien': isFound['pasien']};
    }
  }

  bool tambahData() {
    dataPasien.add(this);
    return true;
  }

  void editData(nama, umur, spesialis) {
    this.nama = nama;
    this.umur = int.parse(umur);
  }

  // bool tambahJadwal(nama, PenjadwalanOption penjadwala){
  //   var isFound = checkIsFound(nama);

  //   if(isFound['isFound'] == true){

  //   }
  // }

  PasienOption({
    required this.nama,
    required this.umur,
  });
}
