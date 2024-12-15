import 'Dokter.dart';
import 'Pasien.dart';
import 'Penjadwalan.dart';

class Pendaftaran {
  List < Dokter > dokter = [];
  List < Pasien > pasien = [];
void daftarDokter (Dokter dokter){
  this.dokter.add(dokter);
  dokter.daftar();
  
}
void daftarpasien (Pasien pasien) {
  this.pasien.add(pasien);
  pasien.daftar();
}
void penjadwalan (Dokter dokter,Jadwal jadwal){
dokter.tambahJadwal(jadwal);
}
}