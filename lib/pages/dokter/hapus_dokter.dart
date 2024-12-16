import 'package:flutter/material.dart';
import 'package:uap_pbo/database/data.dart';
import 'package:uap_pbo/pages/dokter/main_dokter.dart';

class HapusDokter extends StatefulWidget {
  const HapusDokter({super.key});

  @override
  State<HapusDokter> createState() => _HapusDokterState();
}

class _HapusDokterState extends State<HapusDokter> {
  final TextEditingController _searchByNamaController = TextEditingController();

  void _hapus() {
    bool isFound = false;

    for (int i = 0; i < dataDokter.length; i++) {
      if (_searchByNamaController.text == dataDokter[i].nama) {
        isFound = true;
        dataDokter.removeAt(i);
        break;
      }
    }

    if (isFound == true) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Berhasil Menghapus Data Dokter!")));
      
      Navigator.push(
        context, MaterialPageRoute(builder: (context) => MainDokter()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Tidak Dapat Menemukan Dokter!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Hapus"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: _searchByNamaController,
                decoration:
                    const InputDecoration(labelText: "Cari Menggunakan Nama"),
              ),
              ElevatedButton(
                onPressed: _hapus,
                child: const Text(
                  "Cari",
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          ),
        ));
  }
}
