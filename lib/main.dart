import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_get_alkitab_json/book-model.dart';
import 'package:flutter_get_alkitab_json/book-services.dart';
import 'package:flutter_get_alkitab_json/data_services.dart';
import 'package:flutter_get_alkitab_json/dataclass.dart';

void main() {
  runApp(const MaterialApp(title: "Coba Alkitab JSON", home: MyApp(),));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int pasal = 0;
  List indexPerikop = [];
  List<Widget> tilesAyat = [];

  // SERVICES 
  Future<void> loadAlkitabfromJSON() async {
    final String response = 
        await DefaultAssetBundle.of(context).loadString("assets/Alkitab.json");
    final dataAlkitab = await json.decode(response);
    setState(() {
      int startIndexAyat = 0;
      for (int i = 0; i < dataAlkitab.length; i++) {
        
      }
    });
  }
  // END OF SERVICES



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Coba Alkitab JSON"),
      ),
      body: Center(
        child: Column(
          children: [
            
          ],
        ),
      ),
    );
  }
}