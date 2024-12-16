import 'package:flutter/material.dart';

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

    // Logika submit (contoh)
    print("Nama: ${_namaController.text}");
    print("Umur: ${_umurController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Pasien"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Tambah Pasien",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _namaController,
              decoration: const InputDecoration(labelText: "Nama"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Nama tidak boleh kosong!";
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _umurController,
              decoration: const InputDecoration(labelText: "Umur"),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Umur tidak boleh kosong!";
                }
                return null;
              },
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
