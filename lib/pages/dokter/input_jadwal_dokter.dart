import 'dart:html';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uap_pbo/database/data.dart';
import 'package:uap_pbo/option/DokterOption.dart';
import 'package:uap_pbo/option/PenjadwalanOption.dart';
import 'package:uap_pbo/pages/dokter/main_dokter.dart';
import 'package:uap_pbo/pages/penjadwalan/main_penjadwalan.dart';

class InputJadwalDokter extends StatefulWidget {
  const InputJadwalDokter({super.key});

  @override
  State<InputJadwalDokter> createState() => _InputJadwalDokterState();
}

class _InputJadwalDokterState extends State<InputJadwalDokter> {
  final TextEditingController _searchByNamaController = TextEditingController();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _listPraktekController = TextEditingController();

  bool isFound = false;

  DokterOption? dokter;
  PenjadwalanOption? _selectedListPraktek;

  void _submit() {
    if (_namaController.text.isEmpty || _selectedListPraktek == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Nama Dokter & Tanggal Prakter Tidak Boleh Kosong!")));
      return;
    }
    dokter?.tambahListPraktek(_selectedListPraktek!);

    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Berhasil Menambahkan Jadwal Dokter!")));

    Navigator.push(context, MaterialPageRoute(builder: (context) => MainDokter()));
  }

  void _cariDokter() {
    if (_searchByNamaController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Nama Dokter Tidak Boleh Kosong!!")));
      return;
    }

    for (int i = 0; i < dataDokter.length; i++) {
      if (dataDokter[i].nama == _searchByNamaController.text) {
        setState(() {
          dokter = dataDokter[i];
          isFound = true;
        });
      }
    }

    if (isFound == false || dokter == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Dokter Tidak Ditemukan!")));
    } else {
      _namaController.text = dokter?.nama ?? "";
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Dokter Ditemukan!!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Input Jadwal Dokter",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _searchByNamaController,
                    decoration: const InputDecoration(labelText: "Nama Dokter"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                "Pencarian Nama Dokter Tidak Boleh Kosong!")));
                      }
                      return null;
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20.0),
                    child: ElevatedButton(
                        onPressed: _cariDokter,
                        child: const Text("Cari Berdasarkan Nama Dokter")),
                  ),
                  isFound == true
                      ? Column(
                          children: [
                            DropdownButton<PenjadwalanOption>(
                              value: _selectedListPraktek,
                              hint: const Text("Pilih Jadwal"),
                              items: dataPenjadwalan
                                  .where((PenjadwalanOption item) =>
                                      item.isDone == false)
                                  .map((item) {
                                return DropdownMenuItem<PenjadwalanOption>(
                                  value: item,
                                  child: Text(
                                      "(${item.hari}) ${item.waktuMulai} - ${item.waktuSelesai}"),
                                );
                              }).toList(),
                              onChanged: (PenjadwalanOption? newValue) {
                                setState(() {
                                  _selectedListPraktek = newValue;
                                });
                              },
                            ),
                            ElevatedButton(
                                onPressed: _submit,
                                child: const Text("Submit")),
                          ],
                        )
                      : const SizedBox.shrink()
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
