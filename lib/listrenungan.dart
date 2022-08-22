// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_get_alkitab_json/homepage.dart';
import 'package:flutter_get_alkitab_json/renunganpage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';

class ListRenungan extends StatefulWidget {
  const ListRenungan({super.key});

  @override
  State<ListRenungan> createState() => _ListRenunganState();
}

class _ListRenunganState extends State<ListRenungan> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readFile();
  }

  // SERVICES FILE JSON TEXT
  List listDataRenungan = []; // read and display
  List listDataTemp = []; // temp
  String dataRenungan = '';
  
  List<String> itemHighlight = [];
  List<String> itemKitab = [];
  List<String> itemSabda = [];
  List<String> itemTindakan = [];
  List<String> itemTagline = [];

  void readFile() async {
    String path = '/storage/emulated/0/Download/renunganpribadi.txt';
    bool directoryExists = await Directory(path).exists();
    bool fileExists = await File(path).exists();

    if (directoryExists || fileExists) {
      final contents = await File(path).readAsString();
      listDataRenungan = []; //reset dulu
      if (contents.isNotEmpty) {
        listDataRenungan = json.decode(contents);
        setState(() {
          for (int i = 0; i < listDataRenungan.length; i++) {
            itemHighlight.add(listDataRenungan[i]['Highlight'].toString());
            itemKitab.add(listDataRenungan[i]['Kitab'].toString());
            itemSabda.add(listDataRenungan[i]['Sabda'].toString());
            itemTindakan.add(listDataRenungan[i]['Tindakan'].toString());
            itemTagline.add(listDataRenungan[i]['Tagline'].toString());
          }
          listDataTemp = listDataRenungan ;
        });
      }
    }
  }

  void deleteData(int indexdata) async {
    setState(() {
      listDataRenungan.removeAt(indexdata);
      itemHighlight = [];
      itemKitab = [];
      itemSabda = [];
      itemTindakan = [];
      itemTagline = [];
      for (int i = 0; i < listDataRenungan.length; i++) {
        itemHighlight.add(listDataRenungan[i]['Highlight'].toString());
        itemKitab.add(listDataRenungan[i]['Kitab'].toString());
        itemSabda.add(listDataRenungan[i]['Sabda'].toString());
        itemTindakan.add(listDataRenungan[i]['Tindakan'].toString());
        itemTagline.add(listDataRenungan[i]['Tagline'].toString());
      }
    });

    dataRenungan = '';
    dataRenungan = dataRenungan + "[";
    for (int i = 0; i < listDataRenungan.length; i++) {
      dataRenungan = dataRenungan + "{";
      dataRenungan = dataRenungan + '"Highlight":"' + listDataRenungan[i]['Highlight'].toString()
                  + '","Kitab":"' + listDataRenungan[i]['Kitab'].toString()
                  + '","Sabda":"' + listDataRenungan[i]['Sabda'].toString()
                  + '","Tindakan":"' + listDataRenungan[i]['Tindakan'].toString()
                  + '","Tagline":"' +listDataRenungan[i]['Tagline'].toString()
                  + '"}';
      if (listDataRenungan.length != 1 && i != listDataRenungan.length - 1) {
          dataRenungan = dataRenungan + ',';
        }
    }
    dataRenungan = dataRenungan + "]";

    // write string to text file
    String path = '/storage/emulated/0/Download/renunganpribadi.txt';
    File(path).writeAsString(dataRenungan);
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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Renungan", style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 140, 101, 58))),),
                const SizedBox(width: 20,),
              ],
            ),
            const SizedBox(height: 10,),
            TextField(
              onChanged: (searchText) {
                searchText = searchText.toLowerCase();
                setState(() {
                  List listfordisplay = [];
                  for (int i = 0; i < listDataTemp.length; i++) {
                    String temptag = listDataTemp[i]["Tagline"];
                    String temphighlight = listDataTemp[i]["Highlight"];
                    if (temptag.contains(searchText) || temphighlight.contains(searchText)) {
                      listfordisplay.add(listDataTemp[i]);
                    }
                  }
                  listDataRenungan = [];
                  listDataRenungan = listfordisplay;

                  itemHighlight = [];
                  itemKitab = [];
                  itemSabda = [];
                  itemTindakan = [];
                  itemTagline = [];
                  for (int i = 0; i < listDataRenungan.length; i++) {
                    itemHighlight.add(listDataRenungan[i]['Highlight'].toString());
                    itemKitab.add(listDataRenungan[i]['Kitab'].toString());
                    itemSabda.add(listDataRenungan[i]['Sabda'].toString());
                    itemTindakan.add(listDataRenungan[i]['Tindakan'].toString());
                    itemTagline.add(listDataRenungan[i]['Tagline'].toString());
                  }
                });
              },
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
                    return Card(
                      elevation: 0,
                      color: Color.fromARGB(255, 230, 225, 213),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Color.fromARGB(255, 85, 48, 29)
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text('${itemHighlight[index]}', style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 85, 48, 29))),)
                                ),
                                PopupMenuButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(8))
                                  ),
                                  itemBuilder: (context) => [
                                    PopupMenuItem(
                                      child: Row(
                                        children: [
                                          Icon(Icons.create),
                                          SizedBox(width: 5,),
                                          Text("Edit"),
                                        ],
                                      ),
                                      value: 1,
                                    ),
                                    PopupMenuItem(
                                      child: Row(
                                        children: [
                                          Icon(Icons.auto_delete),
                                          SizedBox(width: 5,),
                                          Text("Delete"),
                                        ],
                                      ),
                                      value: 2,
                                    )
                                  ],
                                  onSelected: (value) {
                                    if (value == 1) {
                                      Navigator.push(
                                        context, 
                                        MaterialPageRoute(builder: (context) => RenunganPage(status: 'edit', index: index))
                                      );
                                    } else if (value == 2) {
                                      deleteData(index);
                                    }
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Text('${itemKitab[index]}', style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w300,color: Color.fromARGB(255, 85, 48, 29))),),
                            const SizedBox(height: 5,),
                            Text('${itemTagline[index]}', style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w300,color: Color.fromARGB(255, 85, 48, 29))),),
                            const SizedBox(height: 20,),
                            Text('${itemSabda[index]}', style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 85, 48, 29))),),
                          ],
                        ),
                      ),
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
            MaterialPageRoute(builder: (context) => RenunganPage(status: 'tambah', index: 0))
          );
        },
        backgroundColor: Color.fromARGB(255, 85, 48, 29),
        child: Icon(Icons.add, color: Colors.white,),
      ),
    );
  }
}