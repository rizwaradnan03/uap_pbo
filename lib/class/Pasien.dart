import 'Person.dart';

class Pasien extends Person{
  Pasien(String nama, int umur):super(nama,umur);
  
  @override
  void daftar() {
print ('pasien dengan nama $nama telah terdaftar');  }
}