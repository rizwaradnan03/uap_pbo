import 'package:uap_pbo/option/DokterOption.dart';
import 'package:uap_pbo/option/PasienOption.dart';
import 'package:uap_pbo/option/PenjadwalanOption.dart';

class PendaftaranOption {
  PasienOption? pasien;
  DokterOption? dokter;
  PenjadwalanOption? penjadwalan;

  PendaftaranOption({this.pasien, this.dokter, this.penjadwalan});
}
