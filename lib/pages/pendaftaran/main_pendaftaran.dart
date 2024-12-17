import 'package:flutter/material.dart';
import 'package:uap_pbo/main.dart';
import 'package:uap_pbo/option/MenuOption.dart';
import 'package:uap_pbo/pages/pendaftaran/list_pendaftaran.dart';
import 'package:uap_pbo/pages/pendaftaran/pendaftaran.dart';

class MainPendaftaran extends StatelessWidget {
  MainPendaftaran({super.key});
  final List<MenuOption> menuPendaftarans = [
    MenuOption(
        title: 'Lihat Daftar Pendaftaran',
        icon: Icons.person,
        onTap: (BuildContext context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ListPendaftaran()));
        }),
    MenuOption(
        title: 'Tambahkan Pendaftaran',
        icon: Icons.plus_one_rounded,
        onTap: (BuildContext context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Pendaftaran()));
        }),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
        leading: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
          child: Column(
              children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Menu Pendaftaran",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: menuPendaftarans.length,
            itemBuilder: (context, int index) {
              final option = menuPendaftarans[index];
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
