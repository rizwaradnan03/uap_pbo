import 'package:flutter/material.dart';
import 'package:uap_pbo/database/data.dart';
import 'package:uap_pbo/pages/penjadwalan/main_penjadwalan.dart';

class HapusPenjadwalan extends StatefulWidget {
  const HapusPenjadwalan({super.key});

  @override
  State<HapusPenjadwalan> createState() => _HapusPenjadwalanState();
}

class _HapusPenjadwalanState extends State<HapusPenjadwalan> {
  final TextEditingController _searchByHariContoller = TextEditingController();

  void _hapus() {
    bool isFound = false;

    for (int i = 0; i < dataPenjadwalan.length; i++) {
      if (_searchByHariContoller.text == dataPenjadwalan[i].hari) {
        isFound = true;
        dataPenjadwalan.removeAt(
            i); // Menggunakan removeAt untuk menghapus berdasarkan index
        break;
      }
    }

    if (isFound) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Berhasil Menghapus Data Penjadwalan!")),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainPenjadwalan()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Tidak Dapat Menemukan Data Penjadwalan!")),
      );
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
              controller: _searchByHariContoller,
              decoration:
                  const InputDecoration(labelText: "Cari Menggunakan Hari"),
            ),
            ElevatedButton(
              onPressed: _hapus,
              child: const Text(
                "Cari",
                style: TextStyle(color: Colors.purple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
