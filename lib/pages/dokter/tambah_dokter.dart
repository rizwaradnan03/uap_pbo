import 'package:flutter/material.dart';

class TambahDokter extends StatefulWidget {
  const TambahDokter({super.key});

  @override
  State<TambahDokter> createState() => _TambahDokterState();
}

class _TambahDokterState extends State<TambahDokter> {
  final TextEditingController _namaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: const Text("Tambah Dokter"),
          ),
          Expanded(
            child: Column(
              children: [
                TextFormField(
                  controller: _namaController,
                  decoration: const InputDecoration(
                    labelText: "Nama"
                  ),
                  // validator: (value){
                  //   if (value == null || value.isEmpty){
                  //     return const SnackBar(content: Text("Nama Tidak Boleh Kosong!"));
                  //   }
                  // },
                )
            ]),
          )
        ],
      ),
    );
  }
}