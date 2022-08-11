// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_get_alkitab_json/listcatatan.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';

class CatatanPage extends StatefulWidget {
  final String status;
  final int index;
  const CatatanPage({
    super.key,
    required this.status,
    required this.index
  });

  @override
  State<CatatanPage> createState() => _CatatanPageState();
}

class _CatatanPageState extends State<CatatanPage> {
  // final _ctrKitab = TextEditingController();
  TextEditingController ctr_highlight = TextEditingController();
  TextEditingController ctr_catatan = TextEditingController();
  TextEditingController ctr_tagline = TextEditingController();
  String text_read = "Kejadian 1:2";

  @override
  void dispose() {
    // TODO: implement dispose
    ctr_highlight.dispose();
    ctr_catatan.dispose();
    ctr_tagline.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (widget.status == 'edit') {
      updateData();
    }
  }

  // SERVICES FILE TEXT
  Future<String> get _localPath async { //get path
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async { // get file
    final path = await _localPath;
    return File('/storage/emulated/0/Download/catatanpribadi.txt');
  }

  String dataCatatan = '';
  List listTempData = [];

  Future<File> writeData() async { // write data
    final file = await _localFile;
    
    // read data proses
    final contents = await file.readAsString();
    listTempData = []; //reset dulu
    setState((){
      if (contents.isNotEmpty) {
        listTempData = json.decode(contents);
      }
    });
    // end of read data proses

    // make json and add to string 
    dataCatatan = ''; // reset string

    dataCatatan = dataCatatan + "[";
    if (widget.status == 'tambah') {
      if (listTempData.isNotEmpty) {
        for (int i = 0; i < listTempData.length; i++) {
          dataCatatan = dataCatatan + "{";
          dataCatatan = dataCatatan + '"Highlight":"' + listTempData[i]['Highlight'].toString()
                      + '","Kitab":"' + listTempData[i]['Kitab'].toString()
                      + '","Catatan":"' + listTempData[i]['Catatan'].toString()
                      + '","Tagline":"' +listTempData[i]['Tagline'].toString()
                      + '"}' + ",";
        }
      }
      dataCatatan = dataCatatan + "{"
                + '"Highlight":"' + ctr_highlight.text 
                + '","Kitab":"' + text_read 
                + '","Catatan":"' + ctr_catatan.text 
                + '","Tagline":"' + ctr_tagline.text
                + '"}';
    } 
    else if (widget.status == 'edit') {
      listTempData[widget.index]['Highlight'] = ctr_highlight.text.toString();
      listTempData[widget.index]['Kitab'] = text_read.toString();
      listTempData[widget.index]['Catatan'] = ctr_catatan.text.toString();
      listTempData[widget.index]['Tagline'] = ctr_tagline.text.toString();
      for (int i = 0; i < listTempData.length; i++) {
        dataCatatan = dataCatatan + "{";
        dataCatatan = dataCatatan + '"Highlight":"' + listTempData[i]['Highlight'].toString()
                    + '","Kitab":"' + listTempData[i]['Kitab'].toString()
                    + '","Catatan":"' + listTempData[i]['Catatan'].toString()
                    + '","Tagline":"' +listTempData[i]['Tagline'].toString()
                    + '"}';
        if (listTempData.length != 1 && i != listTempData.length - 1) {
          dataCatatan = dataCatatan + ',';
        }
      }
    }
    dataCatatan = dataCatatan + "]";
    print("data cat: $dataCatatan");
    // end of add json to string
    
    // write string of json to local file
    return file.writeAsString(dataCatatan);
  }

  void updateData() async {
    // read data proses
    final file = await _localFile;
    final contents = await file.readAsString();
    listTempData = []; //reset dulu
    setState((){
      if (contents.isNotEmpty) {
        listTempData = json.decode(contents);
      }
    });
    // end of read data

    setState(() {
      ctr_highlight.text = listTempData[widget.index]['Highlight'].toString();
      ctr_catatan.text = listTempData[widget.index]['Catatan'].toString();
      ctr_tagline.text = listTempData[widget.index]['Tagline'].toString();
    });
  }

  // void readData() async {
  //   final file = await _localFile;
  //   final contents = await file.readAsString();
  //   listTempData = []; //reset dulu
  //   setState((){
  //     if (contents.isNotEmpty) {
  //       listTempData = json.decode(contents);
  //     }
  //   });
  // }
  // END OF SERVICES


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_rounded),
          color: const Color.fromARGB(255, 140, 101, 58)
        ),
        elevation: 0,
        title: Text("Kembali", style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 140, 101, 58), fontWeight: FontWeight.bold)),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Tambah Catatan", style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 30, color: Color.fromARGB(255, 85, 48, 29), fontWeight: FontWeight.bold))),
              const SizedBox(height: 40,),
              Text("Highlight Bacaan", style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 85, 48, 29)))),
              const SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 140, 101, 58),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Kejadian 1 : 2", style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 253, 255, 252)))
                      ),
                      // TextField(
                      //   style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 12, color: Color.fromARGB(255, 253, 255, 252))),
                      //   decoration: const InputDecoration(
                      //     border: InputBorder.none,
                      //     hintText: "Kejadian 1:2"
                      //   ),
                      // ),
                    ),
                    TextField(
                      controller: ctr_highlight,
                      cursorColor: Color.fromARGB(255, 85, 48, 29),
                      decoration: const InputDecoration(
                        fillColor: Color.fromARGB(255, 230, 225, 213),
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Color.fromARGB(255, 85, 48, 29)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 85, 48, 29)),
                        ),
                        contentPadding: EdgeInsets.all(10),
                      ),
                      maxLines: 5,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              Text("Catatan", style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 85, 48, 29)))),
              TextField(
                controller: ctr_catatan,
                cursorColor: Color.fromARGB(255, 85, 48, 29),
                decoration: const InputDecoration(
                  fillColor: Color.fromARGB(255, 230, 225, 213),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Color.fromARGB(255, 85, 48, 29)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 85, 48, 29)),
                  ),
                  contentPadding: EdgeInsets.all(10),
                ),
                maxLines: 7,
              ),
              const SizedBox(height: 30,),
              Text("Tagline", style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 85, 48, 29)))),
              TextField(
                controller: ctr_tagline,
                cursorColor: const Color.fromARGB(255, 85, 48, 29),
                decoration: const InputDecoration(
                  fillColor: Color.fromARGB(255, 230, 225, 213),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Color.fromARGB(255, 85, 48, 29)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 85, 48, 29)),
                  ),
                  contentPadding: EdgeInsets.all(10),
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 30,),
              Text("Pilih Warna", style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 85, 48, 29)))),
              const SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      writeData();
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => ListCatatan())
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 140, 101, 58),
                      elevation: 10,
                      padding: const EdgeInsets.all(5),
                    ),
                    child: (widget.status == 'tambah')
                    ? Text("Tambah Catatan", style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 20), fontWeight: FontWeight.bold),)
                    : Text("Edit Catatan", style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 20), fontWeight: FontWeight.bold),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}