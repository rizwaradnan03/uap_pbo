import 'package:flutter/material.dart';
import 'package:uap_pbo/option/PasienOption.dart';
import 'package:uap_pbo/pages/pasien/main_pasien.dart';

class TambahPasien extends StatefulWidget {
  const TambahPasien({super.key});

  @override
  State<TambahPasien> createState() => _TambahPasienState();
}

class _TambahPasienState extends State<TambahPasien> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _umurController = TextEditingController();

  void _submit() {
    if (_namaController.text.isEmpty || _umurController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Semua kolom harus diisi!")),
      );
      return;
    }

    try {
      var pasien = PasienOption(
        nama: _namaController.text,
        umur: int.parse(_umurController.text),
      );

      var tambah = pasien.tambahData();
      if (tambah == false) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Gagal Membuat Data Pasien Karena Sudah Terdaftar!")));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Sukses Membuat Data Pasien!")));

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainPasien()),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Terjadi kesalahan, cek kembali data Anda!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambahkan Pasien"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Tambahkan Pasien",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _namaController,
              decoration: const InputDecoration(labelText: "Nama"),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _umurController,
              decoration: const InputDecoration(labelText: "Umur"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                      vertical: 16, horizontal: 24),
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
