import 'package:flutter/material.dart';
import 'package:uap_pbo/database/data.dart';
import 'package:uap_pbo/option/DokterOption.dart';
import 'package:uap_pbo/pages/dokter/main_dokter.dart';

class EditDokter extends StatefulWidget {
  const EditDokter({super.key});

  @override
  State<EditDokter> createState() => _EditDokterState();
}

class _EditDokterState extends State<EditDokter> {
  final TextEditingController _searchByNamaController = TextEditingController();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _umurController = TextEditingController();
  final TextEditingController _spesialisController = TextEditingController();

  bool isFound = false;

  DokterOption? dokter;

  void _searchByNama() {
    bool isFoundDokter = false;

    for (int i = 0; i < dataDokter.length; i++) {
      if (dataDokter[i].nama == _searchByNamaController.text) {
        isFoundDokter = true;
        setState(() {
          isFound = true;
        });
        dokter = dataDokter[i];
        break;
      }
    }

    if (isFoundDokter == false && dokter == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Dokter Tidak Ditemukan!")));
      return;
    }

    if (isFoundDokter == true && dokter != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Dokter Ditemukan!")));

      _namaController.text = dokter?.nama ?? "";
      _umurController.text = dokter?.umur.toString() ?? "";
      _spesialisController.text = dokter?.spesialis ?? "";
    }
  }

  void _edit() {
    if (dokter != null) {
      dokter!.editData(_namaController.text, _umurController.text,
          _spesialisController.text);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Berhasil Mengubah Data Dokter!")));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainDokter()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Dokter"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              readOnly: isFound == true ? true : false,
              controller: _searchByNamaController,
              decoration: const InputDecoration(labelText: "Cari Dengan Nama"),
            ),
            isFound == false
                ? ElevatedButton(
                    onPressed: _searchByNama,
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    child: const Text("Cari Dokter"),
                  )
                : Column(
                    children: [
                      TextFormField(
                        controller: _namaController,
                        decoration: const InputDecoration(
                            labelText: "Nama Dokter Baru"),
                      ),
                      TextFormField(
                        controller: _umurController,
                        decoration: const InputDecoration(
                            labelText: "Umur Dokter Baru"),
                      ),
                      TextFormField(
                        controller: _spesialisController,
                        decoration: const InputDecoration(
                            labelText: "Spesialis Dokter Baru"),
                      ),
                      ElevatedButton(
                        onPressed: _edit,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        child: const Text(
                          "Edit Data",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
