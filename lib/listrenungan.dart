import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class ListRenungan extends StatefulWidget {
  const ListRenungan({super.key});

  @override
  State<ListRenungan> createState() => _ListRenunganState();
}

class _ListRenunganState extends State<ListRenungan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_rounded),
          color: const Color.fromARGB(255, 140, 101, 58)
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("Renungan", style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 140, 101, 58), fontWeight: FontWeight.bold)),),
          ),
        ],
        title: Text("Kembali", style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 140, 101, 58), fontWeight: FontWeight.bold)),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: const [
            TextField(
              cursorColor: Color.fromARGB(255, 95, 95, 95),
              decoration: InputDecoration(
                fillColor: Color.fromARGB(255, 253, 255, 252),
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Color.fromARGB(255, 85, 48, 29)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 85, 48, 29)),
                ),
                hintText: 'Cari Taglines',
                contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5)
              ),
            ),
          ],
        ),
      ),
    );
  }
}