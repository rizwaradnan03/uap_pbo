import 'package:flutter/material.dart';
import 'package:uap_pbo/option/MenuOption.dart';
import 'package:uap_pbo/pages/dokter/tambah_dokter.dart';

class MainDokter extends StatelessWidget {
  MainDokter({super.key});

  final List<MenuOption> menuDokters = [
    MenuOption(
        title: 'Lihat Daftar Dokter',
        icon: Icons.person,
        onTap: (BuildContext context) {}),
    MenuOption(
        title: 'Tambah Dokter',
        icon: Icons.plus_one_rounded,
        onTap: (BuildContext context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const TambahDokter()));
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
            child: const Text(
              "Menu Dokter",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
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
