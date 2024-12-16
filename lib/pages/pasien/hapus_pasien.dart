import 'package:flutter/material.dart';
import 'package:uap_pbo/database/data.dart';
import 'package:uap_pbo/pages/pasien/main_pasien.dart';

class HapusPasien extends StatefulWidget {
  const HapusPasien({super.key});

  @override
  State<HapusPasien> createState() => _HapusPasienState();
}

class _HapusPasienState extends State<HapusPasien> {
  final TextEditingController _searchByNamaController = TextEditingController();

  void _hapus(){
    bool isFound = false;

    for (int i =0;i< dataPasien.length;i++){
      if(_searchByNamaController.text == dataPasien[i].nama){
        isFound = true;
        dataPasien.removeAt(i);
        break;
      }
    }

    if(isFound == true){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Berhasil Menghapus Data Pasien!")));
      Navigator.push(
      context, MaterialPageRoute(builder: (context) => MainPasien()));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Tidak Dapat Menemukan Data Pasien!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hapus"),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: _searchByNamaController,
              decoration: const InputDecoration(labelText: "Cari Menggunakan Nama"),
            ),
            ElevatedButton(
              onPressed: _hapus, 
              child: const Text("Cari", style: TextStyle(color: Colors.purple),))
          ],
        ),
        
        ),
    );
  }
}