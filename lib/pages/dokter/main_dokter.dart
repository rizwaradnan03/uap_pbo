import 'package:flutter/material.dart';
import 'package:uap_pbo/main.dart';
import 'package:uap_pbo/option/MenuOption.dart';
import 'package:uap_pbo/pages/dokter/edit_dokter.dart';
import 'package:uap_pbo/pages/dokter/hapus_dokter.dart';
import 'package:uap_pbo/pages/dokter/input_jadwal_dokter.dart';
import 'package:uap_pbo/pages/dokter/list_dokter.dart';
import 'package:uap_pbo/pages/dokter/selesai_jadwal_dokter.dart';
import 'package:uap_pbo/pages/dokter/tambah_dokter.dart';

class MainDokter extends StatelessWidget {
  MainDokter({super.key});

  final List<MenuOption> menuDokters = [
    MenuOption(
        title: 'Lihat Daftar Dokter',
        icon: Icons.person,
        onTap: (BuildContext context) {
          Navigator.push(context, 
          MaterialPageRoute(builder: (context) => const ListDokter()));
        }),
    MenuOption(
        title: 'Tambah Dokter',
        icon: Icons.plus_one_rounded,
        onTap: (BuildContext context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const TambahDokter()));
        }),
    MenuOption(
        title: 'Edit Dokter',
        icon: Icons.edit,
        onTap: (BuildContext context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const EditDokter()));
        }),
    MenuOption(
        title: 'Hapus Dokter',
        icon: Icons.delete,
        onTap: (BuildContext context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HapusDokter()));
        }),
    MenuOption(
        title: 'Input Jadwal Dokter',
        icon: Icons.calendar_month,
        onTap: (BuildContext context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const InputJadwalDokter()));
        }),
        MenuOption(
        title: 'Selesai Jadwal Dokter',
        icon: Icons.calendar_month,
        onTap: (BuildContext context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SelesaiJadwalDokter()));
        }),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
          },
        ),
      ),
        body: Center(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Menu Dokter",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: menuDokters.length,
              itemBuilder: (context, int index) {
                final option = menuDokters[index];
                return Card(
                  child: ListTile(
                    leading: Icon(option.icon, size: 40, color: Colors.green),
                    title: Text(option.title,
                        style: TextStyle(fontSize: 20, color: const Color.fromARGB(255, 0, 0, 0))),
                    onTap: () {
                      option.onTap(context);
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}
