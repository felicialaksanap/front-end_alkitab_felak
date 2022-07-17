import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class ListAlkitab extends StatefulWidget {
  const ListAlkitab({super.key});

  @override
  State<ListAlkitab> createState() => _ListAlkitabState();
}

class _ListAlkitabState extends State<ListAlkitab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 140, 101, 58),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Alkitab", 
          style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white))
        ),
      ),
    );
  }
}