import 'Penjadwalan.dart';
import 'Person.dart';

class Dokter extends Person {
  String? spesialis;
  List<Jadwal> list_praktek = [];
  Dokter(String nama, int umur, this.spesialis) : super(nama, umur);

  void tambahJadwal(Jadwal jadwal){
    list_praktek.add(jadwal);
    print('Jadwal telah ditambahkan!');
  }

  @override
  void daftar() {
    print('Dokter $nama terdaftar!');
  }
}