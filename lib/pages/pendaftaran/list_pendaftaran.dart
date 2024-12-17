import 'package:flutter/material.dart';
import 'package:uap_pbo/database/data.dart';
import 'package:uap_pbo/option/DokterOption.dart';
import 'package:uap_pbo/option/PendaftaranOption.dart';
import 'package:uap_pbo/option/PenjadwalanOption.dart';

class ListPendaftaran extends StatefulWidget {
  const ListPendaftaran({super.key});

  @override
  _ListPendaftaranState createState() => _ListPendaftaranState();
}

class _ListPendaftaranState extends State<ListPendaftaran> {
  List<PenjadwalanOption> penjadwalan = [];

  void _handleSelesai(PendaftaranOption pendaftaran) {
    bool isFoundDokter = false;
    DokterOption? dokter;
    for (int i = 0; i < dataDokter.length; i++) {
      if (dataDokter[i].nama == pendaftaran.dokter!.nama) {
        dokter = dataDokter[i];
        isFoundDokter = true;
        break;
      }
    }

    if (dokter == null && isFoundDokter == false) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Tidak Dapat Menyelesaikan Pendafataran")));
      return;
    }

    bool isSuccessedRemoveListPraktekFromDokter = false;
    for (int i = 0; i < dokter!.listPraktek.length; i++) {
      if (dokter.listPraktek[i].hari == pendaftaran.penjadwalan!.hari &&
          dokter.listPraktek[i].waktuMulai ==
              pendaftaran.penjadwalan!.waktuMulai &&
          dokter.listPraktek[i].waktuSelesai ==
              pendaftaran.penjadwalan!.waktuSelesai) {
        dokter.listPraktek.removeAt(i);
        isSuccessedRemoveListPraktekFromDokter = true;
        break;
      }
    }

    for(int i = 0;i < dataPenjadwalan.length;i++){
      if(dataPenjadwalan[i] == pendaftaran.penjadwalan){
        dataPenjadwalan.removeAt(i);
        break;
      }
    }

    if (isSuccessedRemoveListPraktekFromDokter == true) {
      bool isFoundPendaftaran = false;
      for (int i = 0; i < dataPendaftaran.length; i++) {
        if (dataPendaftaran[i].dokter == pendaftaran.dokter &&
            dataPendaftaran[i].pasien == pendaftaran.pasien &&
            dataPendaftaran[i].penjadwalan == pendaftaran.penjadwalan) {
          setState(() {
            dataPendaftaran.removeAt(i);
          });

          isFoundPendaftaran = true;
          break;
        }
      }

      if (isFoundPendaftaran == true) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Berhasil Menyelesaikan!")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Pendaftaran"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Table(
          border: TableBorder.all(),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            const TableRow(
              decoration: BoxDecoration(color: Colors.grey),
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Nama (Pasien)",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Nama (Dokter)",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Jadwal Pelaksanaan",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Selesaikan",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            ...dataPendaftaran.map(
              (pendaftaran) => TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      pendaftaran.pasien!.nama,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      pendaftaran.dokter!.nama,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        "Hari : ${pendaftaran.penjadwalan!.hari} \n Waktu Mulai : ${pendaftaran.penjadwalan!.waktuMulai} \n Waktu Selesai : ${pendaftaran.penjadwalan!.waktuSelesai}",
                        textAlign: TextAlign.center),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          _handleSelesai(pendaftaran);
                        },
                        child: const Text("Selesai"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
