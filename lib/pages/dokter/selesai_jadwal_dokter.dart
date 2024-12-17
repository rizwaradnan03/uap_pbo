import 'package:flutter/material.dart';
import 'package:uap_pbo/database/data.dart';
import 'package:uap_pbo/option/DokterOption.dart';
import 'package:uap_pbo/option/PenjadwalanOption.dart';
import 'package:uap_pbo/pages/dokter/main_dokter.dart';

class SelesaiJadwalDokter extends StatefulWidget {
  const SelesaiJadwalDokter({super.key});

  @override
  State<SelesaiJadwalDokter> createState() => _SelesaiJadwalDokterState();
}

class _SelesaiJadwalDokterState extends State<SelesaiJadwalDokter> {
  final TextEditingController _searchByNamaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  DokterOption? dokter;
  bool isFound = false;
  PenjadwalanOption? _selectedListPraktek;
  List<PenjadwalanOption?> penjadwalan = [];

  void _searchByNama() {
    for (int i = 0; i < dataDokter.length; i++) {
      if (_searchByNamaController.text == dataDokter[i].nama) {
        setState(() {
          isFound = true;
        });
        dokter = dataDokter[i];
        penjadwalan.addAll(dataDokter[i].listPraktek);
        break;
      }
    }
  }

  void _submit() {
    bool isPenjadwalanFound = false;
    bool isRemoveSuccess = false;
    for (int i = 0; i < dataPenjadwalan.length; i++) {
      if (_selectedListPraktek?.hari == dataPenjadwalan[i].hari &&
          _selectedListPraktek?.waktuMulai == dataPenjadwalan[i].waktuMulai &&
          _selectedListPraktek?.waktuSelesai ==
              dataPenjadwalan[i].waktuSelesai) {
        dataPenjadwalan.removeAt(i);
        isPenjadwalanFound = true;
      }
    }

    if (isPenjadwalanFound == true) {
      if (dokter != null) {
        for (int i = 0; i < dokter!.listPraktek.length; i++) {
          if (dokter!.listPraktek[i].hari == _selectedListPraktek?.hari &&
              dokter!.listPraktek[i].waktuMulai ==
                  _selectedListPraktek?.waktuMulai &&
              dokter!.listPraktek[i].waktuSelesai ==
                  _selectedListPraktek?.waktuSelesai) {
            dokter!.listPraktek.removeAt(i);
            isRemoveSuccess = true;
            break;
          }
        }
      }
    }

    if (isRemoveSuccess == true) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Berhasil Menyelesaikan Jadwal Dokter!")));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainDokter()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Gagal Menyelesaikan Jadwal!")));
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
                      isFound == true
                          ? Column(
                              children: [
                                DropdownButton<PenjadwalanOption>(
                                  value: _selectedListPraktek,
                                  hint:
                                      const Text("Pilih Jawdwal untuk Dihapus"),
                                  items: penjadwalan
                                      .where((item) => item != null)
                                      .map((item) {
                                    return DropdownMenuItem<PenjadwalanOption>(
                                      value: item,
                                      child: Text(
                                          "(${item?.hari}) ${item?.waktuMulai} - ${item?.waktuSelesai}"),
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
                                  child: const Text("Submit"),
                                )
                              ],
                            )
                          : const SizedBox.shrink(),
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
