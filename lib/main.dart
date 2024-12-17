import 'dart:js';
import 'package:flutter/material.dart';
import 'package:uap_pbo/pages/dokter/main_dokter.dart';
import 'package:uap_pbo/pages/pasien/main_pasien.dart';
import 'package:uap_pbo/pages/pendaftaran/main_pendaftaran.dart';
import 'package:uap_pbo/pages/penjadwalan/main_penjadwalan.dart';
import 'package:uap_pbo/option/MenuOption.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  final List<MenuOption> menuOptions = [
    MenuOption(
        title: 'Dokter',
        icon: Icons.local_hospital,
        onTap: (BuildContext context) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MainDokter()));
        }),
    MenuOption(
        title: 'Pasien',
        icon: Icons.people,
        onTap: (BuildContext context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MainPasien()));
        }),
    MenuOption(
        title: 'Penjadwalan',
        icon: Icons.calendar_today,
        onTap: (BuildContext context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MainPenjadwalan()));
        }),
    MenuOption(
        title: 'Pendaftaran',
        icon: Icons.check,
        onTap: (BuildContext context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MainPendaftaran()));
        }),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text("Menu Utama",
              style: TextStyle(fontSize: 28, color: Colors.blue)),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: menuOptions.length,
            itemBuilder: (context, int index) {
              final option = menuOptions[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  leading: Icon(option.icon, size: 40, color: Colors.blue),
                  title:
                      Text(option.title, style: const TextStyle(fontSize: 18)),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    option.onTap(context);
                  },
                ),
              );
            },
          ),
        )
      ],
    ));
  }
}
