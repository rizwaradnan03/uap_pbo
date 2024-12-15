import 'package:flutter/material.dart';

class TambahPenjadwalan extends StatefulWidget {
  const TambahPenjadwalan({super.key});

  @override
  State<TambahPenjadwalan> createState() => _TambahPenjadwalanState();
}

class _TambahPenjadwalanState extends State<TambahPenjadwalan> {
  final TextEditingController _namaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: const Text("Tambah PTambahPenjadwalan"),
          ),
          Expanded(
            child: Column(children: [
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(labelText: "Nama"),
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
