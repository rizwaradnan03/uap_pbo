import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Add this import for date formatting
import 'package:uap_pbo/option/PenjadwalanOption.dart';
import 'package:uap_pbo/pages/penjadwalan/main_penjadwalan.dart';

class TambahPenjadwalan extends StatefulWidget {
  const TambahPenjadwalan({super.key});

  @override
  State<TambahPenjadwalan> createState() => _TambahPenjadwalanState();
}

class _TambahPenjadwalanState extends State<TambahPenjadwalan> {
  final TextEditingController _hariController = TextEditingController();
  final TextEditingController _waktuMulaiController = TextEditingController();
  final TextEditingController _waktuSelesaiController = TextEditingController();

  DateTime? _selectedWaktuMulai;
  DateTime? _selectedWaktuSelesai;

  Future<void> _selectWaktuMulai(BuildContext context) async {
    // Open the DatePicker dialog
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Initial date shown
      firstDate: DateTime(2000), // Earliest selectable date
      lastDate: DateTime(2101), // Latest selectable date
    );

    if (pickedDate != null) {
      // Store the selected date in _selectWaktuMulai
      setState(() {
        _selectedWaktuMulai = pickedDate;
        // Format and display the selected date in the TextField
        _waktuMulaiController.text =
            DateFormat('dd/MM/yyyy').format(pickedDate);
      });
    }
  }

  Future<void> _selectWaktuSelesai(BuildContext context) async {
    // Open the DatePicker dialog
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Initial date shown
      firstDate: DateTime(2000), // Earliest selectable date
      lastDate: DateTime(2101), // Latest selectable date
    );

    if (pickedDate != null) {
      // Store the selected date in _selectWaktuMulai
      setState(() {
        _selectedWaktuSelesai = pickedDate;
        // Format and display the selected date in the TextField
        _waktuSelesaiController.text =
            DateFormat('dd/MM/yyyy').format(pickedDate);
      });
    }
  }

  void _submit() {
    // Validate if fields are not empty
    if (_hariController.text.isEmpty ||
        _waktuMulaiController.text.isEmpty ||
        _waktuSelesaiController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Field Diatas Tidak Boleh Kosong!!")));
      return;
    }

    // Ensure that _selectWaktuMulai is not null before using it
    if (_selectWaktuMulai == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Tanggal Mulai Harus Dipilih!")));
      return;
    }

    var penjadwalan = PenjadwalanOption(
        hari: _hariController.text,
        waktuMulai: _selectedWaktuMulai!, // Use the formatted date text
        waktuSelesai: _selectedWaktuSelesai!);
    var tambah = penjadwalan.tambahData();
    if (tambah == false) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content:
              Text("Gagal Membuat Data Penjadwalan Dikarenakan Duplikasi!")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Sukses Membuat Data Penjadwalan")));

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainPenjadwalan()));
    }

    // Debugging print statement for Penjadwalan object
    print("Data Penjadwalan : ${penjadwalan}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Tambah Penjadwalan",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 18.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _hariController,
                    decoration: const InputDecoration(labelText: "Hari"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Hari Tidak Boleh Kosong!";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _waktuMulaiController,
                    readOnly:
                        true, // Disable manual input, user selects via date picker
                    decoration: const InputDecoration(labelText: "Waktu Mulai"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Waktu Mulai Tidak Boleh Kosong!";
                      }
                      return null;
                    },
                    onTap: () => _selectWaktuMulai(context),
                  ),
                  TextFormField(
                    controller: _waktuSelesaiController,
                    decoration:
                        const InputDecoration(labelText: "Waktu Selesai"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Waktu Selesai Tidak Boleh Kosong!";
                      }
                      return null;
                    },
                    onTap: () => _selectWaktuSelesai(context),
                  ),
                  ElevatedButton(
                      onPressed: _submit, child: const Text("Submit"))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
