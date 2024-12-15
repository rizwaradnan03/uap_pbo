import 'package:flutter/material.dart';
import 'package:uap_pbo/database/data.dart';
import 'package:uap_pbo/option/DokterOption.dart';

class TambahDokter extends StatefulWidget {
  const TambahDokter({super.key});

  @override
  State<TambahDokter> createState() => _TambahDokterState();
}

class _TambahDokterState extends State<TambahDokter> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _umurController = TextEditingController();
  final TextEditingController _spesialisController = TextEditingController();

  void _submit() {
    if (_namaController.text.isEmpty &&
        _umurController.text.isEmpty &&
        _spesialisController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Field Diatas Tidak Boleh Kosong!!")));
      return;
    }

    var dokter = DokterOption(
        nama: _namaController.text,
        umur: int.parse(_umurController.text),
        spesialis: _spesialisController.text);
    dokter.tambahData();

    print("Data Dokter : ${dataDokter}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Tambah Dokter",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 18),
            child: Column(children: [
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(labelText: "Nama"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Nama Tidak Boleh Kosong!")));
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _umurController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Umur"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Umur Tidak Boleh Kosong!")));
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _spesialisController,
                decoration: const InputDecoration(labelText: "Spesialis"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Spesialis Tidak Boleh Kosong!")));
                  }
                  return null;
                },
              ),
              ElevatedButton(onPressed: _submit, child: Text("Submit Tombol"))
            ]),
          ))
        ],
      ),
    );
  }
}
