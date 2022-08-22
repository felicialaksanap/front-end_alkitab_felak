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
  }


  // SERVICES FILE JSON
  // Future<String> get _localPath async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   return directory.path;
  // }

  // Future<File> get _localFile async {
  //   final path = await _localPath;
  //   return File('/storage/emulated/0/Download/catatanpribadi.txt');
  // }
  List listDataCat = []; // read and display
  List listDataTemp = []; // temp
  String dataCatatan = '';
  
  List<String> itemHighlight = [];
  List<String> itemKitab = [];
  List<String> itemCatatan = [];
  List<String> itemTagline = [];

  void readFile() async {
    String path = '/storage/emulated/0/Download/catatanpribadi.txt';
    bool directoryExists = await Directory(path).exists();
    bool fileExists = await File(path).exists();

    if (directoryExists || fileExists) {
      final contents = await File(path).readAsString();
      listDataCat = [];
      if (contents.isNotEmpty) {
        listDataCat = json.decode(contents);
        setState(() {
          for (int i = 0; i < listDataCat.length; i++) {
            itemHighlight.add(listDataCat[i]['Highlight'].toString());
            itemKitab.add(listDataCat[i]['Kitab'].toString());
            itemCatatan.add(listDataCat[i]['Catatan'].toString());
            itemTagline.add(listDataCat[i]['Tagline'].toString());
          }
          listDataTemp = listDataCat;
        });
      }
    }
  }

  void deleteData(int indexdata) async {
    // final file = await _localFile;
    setState(() {
      listDataCat.removeAt(indexdata);
      itemHighlight = [];
      itemKitab = [];
      itemCatatan = [];
      itemTagline = [];
      for (int i = 0; i < listDataCat.length; i++) {
        itemHighlight.add(listDataCat[i]['Highlight'].toString());
        itemKitab.add(listDataCat[i]['Kitab'].toString());
        itemCatatan.add(listDataCat[i]['Catatan'].toString());
        itemTagline.add(listDataCat[i]['Tagline'].toString());
      }
    });

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

    // write string to text file
    String path = '/storage/emulated/0/Download/catatanpribadi.txt';
    File(path).writeAsString(dataCatatan);
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
                  // print("result: $listfordisplay");
                  listDataCat = [];
                  listDataCat = listfordisplay;

                  itemHighlight = [];
                  itemKitab = [];
                  itemCatatan = [];
                  itemTagline = [];
                  for (int i = 0; i < listDataCat.length; i++) {
                    itemHighlight.add(listDataCat[i]['Highlight'].toString());
                    itemKitab.add(listDataCat[i]['Kitab'].toString());
                    itemCatatan.add(listDataCat[i]['Catatan'].toString());
                    itemTagline.add(listDataCat[i]['Tagline'].toString());
                  }
                  // listDataCat = listfordisplay;
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
                                            SizedBox(width: 5),
                                            Text("Edit"),
                                          ],
                                        ),
                                        value: 1,
                                      ),
                                      PopupMenuItem(
                                        child: Row(
                                          children: [
                                            Icon(Icons.auto_delete),
                                            SizedBox(width: 5),
                                            Text("Delete"),
                                          ],
                                        ),
                                        value: 2,
                                      ),
                                    ],
                                    onSelected: (value) {
                                      if (value == 1) {
                                        Navigator.push(
                                          context, 
                                          MaterialPageRoute(builder: (context) => CatatanPage(status: 'edit', index: index))
                                        );
                                      } else if (value == 2) {
                                        deleteData(index);
                                      }
                                    },
                                  )
                                  // IconButton(
                                  //   onPressed: () {
                                  //   }, 
                                  //   icon: Icon(Icons.more_horiz_outlined)
                                  // ),
                                ],
                              ),
                              const SizedBox(height: 5,),
                              Text('${itemKitab[index]}', style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w300,color: Color.fromARGB(255, 85, 48, 29))),),
                              const SizedBox(height: 5,),
                              Text('${itemTagline[index]}', style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w300,color: Color.fromARGB(255, 85, 48, 29))),),
                              const SizedBox(height: 20,),
                              Text('${itemCatatan[index]}', style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 85, 48, 29))),),
                            ],
                          ),
                        ),
                      ),
                      // onTap: () {
                      //   // Update data
                      //   Navigator.push(
                      //     context, 
                      //     MaterialPageRoute(builder: (context) => CatatanPage(status: 'edit', index: index))
                      //   );

                      // },
                      // onLongPress: () {
                      //   // delete data
                      //   deleteData(index);
                      // },
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