import 'package:uap_pbo/database/data.dart';
import 'package:uap_pbo/option/PenjadwalanOption.dart';

class DokterOption {
  String nama;
  int umur;
  String spesialis;
  List<PenjadwalanOption> listPraktek = [];

  void tambahListPraktek(PenjadwalanOption penjadwalan) {
    penjadwalan.isDone = true;
    listPraktek.add(penjadwalan);
  }

  Map<String, dynamic> checkIsFound(nama) {
    bool isFound = false;
    DokterOption? dokter;
    for (int i = 0; i < dataDokter.length; i++) {
      if (dataDokter[i].nama == nama) {
        isFound = true;
        dokter = dataDokter[i];
        break;
      }
    }

    return {'isFound': isFound, 'dokter': dokter};
  }

  dynamic searchDokter(nama) {
    var isFound = checkIsFound(nama);
    if (isFound['isFound'] == true) {
      return {'dokter': isFound['dokter']};
    }
  }

  bool tambahData() {
    var isFound = checkIsFound(nama);
    if (isFound['isFound'] == false) {
      dataDokter.add(this);
      print("(Dokter) Data Dokter Telah Ditambahkan!");
      return true;
    } else {
      print("(Dokter) Data Dokter Tidak Boleh Ada Duplikasi!");
      return false;
    }
  }

  void editData(nama, umur, spesialis) {
    this.nama = nama;
    this.umur = int.parse(umur);
    this.spesialis = spesialis;
  }

  // int indexHapusDokter(nama){
  //   bool isFound = false;

  //   for(int i = 0;i < dataDokter.length;i++){
      
  //   }
  // }

  void selesaiJadwal(nama, PenjadwalanOption penjadwalan) {
    var isFound = checkIsFound(nama);

    if (isFound['isFound'] == true) {
      for (int i = 0; i < isFound['dokter']['listPraktek'].length; i++) {
        var dokterListPrakteks = isFound['dokter']['listPraktek'][i];
        if (penjadwalan.hari == dokterListPrakteks.hari &&
            penjadwalan.waktuMulai == dokterListPrakteks.waktuMulai &&
            penjadwalan.waktuSelesai == dokterListPrakteks.waktuSelesai) {
          dokterListPrakteks.removeAt(i);
        }
      }
    }
  }

  DokterOption(
      {required this.nama, required this.umur, required this.spesialis});
}
