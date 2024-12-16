import 'package:flutter/material.dart';
import 'package:uap_pbo/option/MenuOption.dart';
import 'package:uap_pbo/pages/pasien/list_pasien.dart';
import 'package:uap_pbo/pages/pasien/tambah_pasien.dart';

class MainPasien extends StatelessWidget {
  MainPasien({super.key});
  final List<MenuOption> menuPasiens = [
    MenuOption(
        title: 'Lihat Daftar Pasien',
        icon: Icons.person,
        onTap: (BuildContext context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ListPasien()));
        }),
    MenuOption(
        title: 'Tambahkan Pasien',
        icon: Icons.plus_one_rounded,
        onTap: (BuildContext context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const TambahPasien()));
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
            "Menu Pasien",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: menuPasiens.length,
            itemBuilder: (context, int index) {
              final option = menuPasiens[index];
              return Card(
                  child: ListTile(
                      leading: Icon(option.icon,
                          size: 40, color: Colors.indigoAccent),
                      title: Text(option.title,
                          style: TextStyle(
                              fontSize: 20, color: Colors.indigoAccent)),
                      onTap: () {
                        option.onTap(context);
                      }));
            },
          ),
        )
      ].toList())),
    );
  }
}
