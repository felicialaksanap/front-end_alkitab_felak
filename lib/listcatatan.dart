// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_get_alkitab_json/catatanpage.dart';
import 'package:flutter_get_alkitab_json/homepage.dart';
import 'package:flutter_get_alkitab_json/listalkitabtemp.dart';
import 'package:flutter_get_alkitab_json/renunganpage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';

class ListCatatan extends StatefulWidget {
  const ListCatatan({
    super.key,
  });

  @override
  State<ListCatatan> createState() => _ListCatatanState();
}

class _ListCatatanState extends State<ListCatatan> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readFile();
    // readFile();
  }

  // SERVICES FILE JSON
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('/storage/emulated/0/Download/catatanpribadi.txt');
  }
  
  List listDataCat = [];
  List<String> itemHighlight = [];
  List<String> itemKitab = [];
  List<String> itemCatatan = [];
  List<String> itemTagline = [];

  void readFile() async {
    final file = await _localFile;
    final contents = await file.readAsString();
    setState(() {
      // print("content : $contents");
      if (contents.isNotEmpty) {
        listDataCat = json.decode(contents);
        for (int i = 0; i < listDataCat.length; i++) {
          itemHighlight.add(listDataCat[i]['Highlight'].toString());
          itemKitab.add(listDataCat[i]['Kitab'].toString());
          itemCatatan.add(listDataCat[i]['Catatan'].toString());
          itemTagline.add(listDataCat[i]['Tagline'].toString());
        }
      }
    });
  }

  String dataCatatan = '';

  Future<File> deleteData(int indexdata) async {
    final file = await _localFile;
    print("data lama: $listDataCat");
    listDataCat.removeAt(indexdata);
    print("data baru : $listDataCat");

    dataCatatan = dataCatatan + "[";
    for (int i = 0; i < listDataCat.length; i++) {
      dataCatatan = dataCatatan + "{";
      dataCatatan = dataCatatan + '"Highlight":"' + listDataCat[i]['Highlight'].toString()
                  + '","Kitab":"' + listDataCat[i]['Kitab'].toString()
                  + '","Catatan":"' + listDataCat[i]['Catatan'].toString()
                  + '","Tagline":"' +listDataCat[i]['Tagline'].toString()
                  + '"}';
      if (listDataCat.length != 1 && i != listDataCat.length - 1) {
          dataCatatan = dataCatatan + ',';
        }
    }
    dataCatatan = dataCatatan + "]";
    print("data cat: $dataCatatan");

    // for (int i = 0; i < listDataCat.length; i++) {
    //   if (i != indexdata) {
    //     // print("masuk");
    //     dataCatBaru = listDataCat[i];
    //   }
    // }
    // print("data baru : $dataCatBaru");    // listDataCat.removeAt(indexdata);
    // print("data: $listDataCat");
    return file.writeAsString(dataCatatan);
  }
  // END OF SERVICES

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => HomePage())
            );
          },
          icon: const Icon(Icons.arrow_back_rounded),
          color: const Color.fromARGB(255, 140, 101, 58)
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Catatan', style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 140, 101, 58))),),
              ],
            ),
            const SizedBox(height: 10,),
            const TextField(
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

            const SizedBox(height: 10,),
            Expanded(
              child: Container(
                child: ListView.builder( 
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Card(
                        elevation: 0,
                        color: const Color.fromARGB(255, 230, 225, 213),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Color.fromARGB(255, 85, 48, 29)
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${itemHighlight[index]}', style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 85, 48, 29))),),
                              const SizedBox(height: 5,),
                              Text('${itemKitab[index]}', style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w300,color: Color.fromARGB(255, 85, 48, 29))),),
                              const SizedBox(height: 20,),
                              Text('${itemCatatan[index]}', style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 85, 48, 29))),),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        // Update data
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => CatatanPage(status: 'edit', index: index))
                        );

                      },
                      onLongPress: () {
                        // delete data
                        deleteData(index);
                      },
                    );  
                  },
                  itemCount: itemHighlight.length,
                )
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => CatatanPage(status: 'tambah', index: 0))
          );
        },
        backgroundColor: Color.fromARGB(255, 85, 48, 29),
        child: Icon(Icons.add, color: Colors.white,),
      ),
    );
  }
}