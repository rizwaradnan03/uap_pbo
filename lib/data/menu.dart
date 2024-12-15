import "package:flutter/material.dart";
import 'package:uap_pbo/pages/dokter/main_dokter.dart';

final List<Map<String, dynamic>> menuData = [
  {
    'title': 'Dokter',
    'page': (BuildContext context) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainDokter()));
    }
  },
  {'title': 'Pasien', 'page': 'pasien'},
  {'title': 'Pendaftaran', 'page': 'pendaftaran'},
  {'title': 'Penjadwalan', 'page': 'penjadwalan'},
];
