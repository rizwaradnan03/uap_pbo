import 'package:flutter/material.dart';
import 'package:uap_pbo/database/data.dart';
import 'package:uap_pbo/option/PenjadwalanOption.dart';

class SelesaiJadwalDokter extends StatefulWidget {
  const SelesaiJadwalDokter({super.key});

  @override
  State<SelesaiJadwalDokter> createState() => _SelesaiJadwalDokterState();
}

class _SelesaiJadwalDokterState extends State<SelesaiJadwalDokter> {
  final TextEditingController _searchByNamaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isFound = false;

  PenjadwalanOption? penjadwalan;

  void _searchByNama() {
    bool isDokterFound = false;

    for (int i = 0; i < dataDokter.length; i++) {
      if (_searchByNamaController.text == dataDokter[i].nama) {
        isFound = true;
        isDokterFound = true;
        penjadwalan = dataDokter[i].listPraktek as PenjadwalanOption?;
        break;
      }
    }

    if (isDokterFound == true) {
      debugPrint("Penjadwalan Dokter nyaah ${penjadwalan}");
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
                "Selesai Jadwal Dokter",
                style: TextStyle(
                  color: Color.fromARGB(255, 15, 217, 12),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _searchByNamaController,
                        decoration:
                            const InputDecoration(labelText: 'Nama Dokter'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Pencarian Nama Dokter Tidak Boleh Kosong';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _searchByNama,
                        child: const Text('Cari'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
