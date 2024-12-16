import 'package:flutter/material.dart';
import 'package:uap_pbo/option/MenuOption.dart';
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
        title: 'Input Jadwal Dokter',
        icon: Icons.plus_one_rounded,
        onTap: (BuildContext context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const InputJadwalDokter()));
        }),
        MenuOption(
        title: 'Selesai Jadwal Dokter',
        icon: Icons.plus_one_rounded,
        onTap: (BuildContext context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SelesaiJadwalDokter()));
        }),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        style: TextStyle(fontSize: 20, color: Colors.green)),
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
