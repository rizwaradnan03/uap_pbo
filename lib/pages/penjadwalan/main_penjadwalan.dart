import 'package:flutter/material.dart';
import 'package:uap_pbo/option/MenuOption.dart';
import 'package:uap_pbo/pages/penjadwalan/list_penjadwalan.dart';
import 'package:uap_pbo/pages/penjadwalan/tambah_penjadwalan.dart';

class MainPenjadwalan extends StatelessWidget {
  MainPenjadwalan({super.key});

  final List<MenuOption> menuPenjadwalans = [
    MenuOption(
        title: 'Lihat Daftar Penjadwalan',
        icon: Icons.access_time,
        onTap: (BuildContext context) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ListPenjadwalan(),
              ));
        }),
    MenuOption(
        title: 'Tambah Penjadwalan',
        icon: Icons.view_agenda,
        onTap: (BuildContext context) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const TambahPenjadwalan()));
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
              "Menu Penjadwalan",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: menuPenjadwalans.length,
              itemBuilder: (context, int index) {
                final option = menuPenjadwalans[index];
                return Card(
                  child: ListTile(
                    leading: Icon(option.icon,
                        size: 40,
                        color: const Color.fromARGB(255, 175, 76, 158)),
                    title: Text(option.title,
                        style: TextStyle(
                            fontSize: 20,
                            color: const Color.fromARGB(255, 175, 76, 162))),
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
