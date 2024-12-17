import 'package:flutter/material.dart';
import 'package:uap_pbo/database/data.dart';
import 'package:uap_pbo/option/DokterOption.dart';
import 'package:uap_pbo/option/PasienOption.dart';
import 'package:uap_pbo/option/PendaftaranOption.dart';
import 'package:uap_pbo/option/PenjadwalanOption.dart';
import 'package:uap_pbo/pages/pendaftaran/main_pendaftaran.dart';

class Pendaftaran extends StatefulWidget {
  const Pendaftaran({super.key});

  @override
  State<Pendaftaran> createState() => _PendaftaranState();
}

class _PendaftaranState extends State<Pendaftaran> {
  PasienOption? _selectedPasien;
  DokterOption? _selectedDokter;
  PenjadwalanOption? _selectedPenjadwalan;

  late List<PenjadwalanOption> penjadwalan;

  bool isDokterSelected = false;

  void _handleSelectedDokter(DokterOption newValue) {
    penjadwalan = [];
    _selectedDokter = newValue;

    setState(() {
      penjadwalan = newValue.listPraktek;
      isDokterSelected = true;
    });
  }

  void _submit() {
    if (_selectedPasien == null &&
        _selectedDokter == null &&
        _selectedPenjadwalan == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content:
              Text("Data Pasien / Dokter / Penjadwalan tidak boleh kosong!")));
      return;
    }

    PendaftaranOption pendaftaran = PendaftaranOption(
        dokter: _selectedDokter,
        pasien: _selectedPasien,
        penjadwalan: _selectedPenjadwalan);

    dataPendaftaran.add(pendaftaran);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Berhasil Menambahkan Data Pendaftaran!")));
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MainPendaftaran()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Pendaftaran"),
        ),
        body: Center(
          child: Column(
            children: [
              DropdownButton<PasienOption>(
                value: _selectedPasien,
                hint: const Text("Pilih Pasien"),
                items: dataPasien.map((pasien) {
                  return DropdownMenuItem<PasienOption>(
                    value: pasien,
                    child: Text(pasien.nama),
                  );
                }).toList(),
                onChanged: (PasienOption? newValue) {
                  setState(() {
                    _selectedPasien = newValue;
                  });
                },
              ),
              DropdownButton<DokterOption>(
                value: _selectedDokter,
                hint: const Text("Pilih Dokter"),
                items: dataDokter.map((pasien) {
                  return DropdownMenuItem<DokterOption>(
                    value: pasien,
                    child: Text(pasien.nama),
                  );
                }).toList(),
                onChanged: (DokterOption? newValue) {
                  setState(() {
                    _handleSelectedDokter(newValue!);
                  });
                },
              ),
              isDokterSelected == true
                  ? Column(children: [
                      DropdownButton<PenjadwalanOption>(
                        value: _selectedPenjadwalan,
                        hint: const Text("Pilih Jadwal Dokter"),
                        items: penjadwalan.map((penjadwalan) {
                          return DropdownMenuItem<PenjadwalanOption>(
                            value: penjadwalan,
                            child: Text(
                                "(${penjadwalan.hari}) ${penjadwalan.waktuMulai} - ${penjadwalan.waktuSelesai}"),
                          );
                        }).toList(),
                        onChanged: (PenjadwalanOption? newValue) {
                          setState(() {
                            _selectedPenjadwalan = newValue;
                          });
                        },
                      ),
                      ElevatedButton(
                        onPressed: _submit,
                        child: const Text(
                          "Dafatar",
                          style: TextStyle(
                              backgroundColor: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      )
                    ])
                  : const SizedBox.shrink(),
            ],
          ),
        ));
  }
}
