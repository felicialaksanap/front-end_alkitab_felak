import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_get_alkitab_json/catatanpage.dart';
import 'package:flutter_get_alkitab_json/listalkitabtemp.dart';
import 'package:flutter_get_alkitab_json/renunganpage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';

class ListCatatan extends StatefulWidget {
  final List<String> highlight;
  final List<String> kitab;
  final List<String> body;
  const ListCatatan({
    super.key,
    required this.highlight,
    required this.kitab,
    required this.body
    // required this.highlight,
    // required this.kitab,
    // required this.body,
    // required this.tagline
  });

  @override
  State<ListCatatan> createState() => _ListCatatanState();
}

class _ListCatatanState extends State<ListCatatan> {
  // List<dataCatatan> itemCatatan = [];

  // List<String> itemJudul = [];
  // List<String> itemKitab = [];
  // List<String> itemBody = [];

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }

  // void addList() {
  //   itemJudul.add(widget.highlight);
  //   itemKitab.add(widget.kitab);
  //   itemBody.add(widget.body);
  // }

  // void addtoList() {
  //   itemHighlight = widget.highlight;
  //   itemKitab = widget.kitab;
  //   itemBody = widget.body;
  //   itemTagline = widget.tagline;

  //   itemCatatan.add(itemHighlight);
  // }


  // List itemJudul = List.generate(10, (index) => "Bumi berbentuk dan kosong");
  // List itemKitab = List.generate(10, (index) => "Mazmur 9 : 2");
  // List itemBody = List.generate(10, (index) => "Lorem ipsum dolor sit amet, consectetur adispiscing elit."
  //                                             + " Tellus dui eget habitant sed ornare enim amet accumsan" 
  //                                             + " egestas. Eu.");


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
  // String itemHighlight = "";
  // String itemKitab = "";
  // String itemCatatan = "";
  // String itemTagline = "";

  void readFile() async {
    final file = await _localFile;
    final contents = await file.readAsString();
    setState(() {
      listDataCat = json.decode(contents);
      for (int i = 0; i < listDataCat.length; i++) {
        itemHighlight.add(listDataCat[i]['Highlight'].toString());
        itemKitab.add(listDataCat[i]['Kitab'].toString());
        itemCatatan.add(listDataCat[i]['Catatan'].toString());
        itemTagline.add(listDataCat[i]['Tagline'].toString());
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readFile();
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
            Navigator.pop(context);
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
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => CatatanPage())
                        );

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
            MaterialPageRoute(builder: (context) => CatatanPage())
          );
        },
        backgroundColor: Color.fromARGB(255, 85, 48, 29),
        child: Icon(Icons.add, color: Colors.white,),
      ),
    );
  }
}