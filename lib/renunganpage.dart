import 'package:flutter/material.dart';
import 'package:flutter_get_alkitab_json/listrenungan.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';

class RenunganPage extends StatefulWidget {
  final String status;
  final int index;
  const RenunganPage({super.key, required this.status, required this.index});

  @override
  State<RenunganPage> createState() => _RenunganPageState();
}

class _RenunganPageState extends State<RenunganPage> {
  TextEditingController ctr_highlight = TextEditingController();
  TextEditingController ctr_sabda = TextEditingController();
  TextEditingController ctr_tindakan = TextEditingController();
  TextEditingController ctr_tagline = TextEditingController();
  String text_read = "Kejadian 1:2";

  @override
  void dispose() {
    // TODO: implement dispose
    ctr_highlight.dispose();
    ctr_sabda.dispose();
    ctr_tindakan.dispose();
    ctr_tagline.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.status == 'edit') {
      updateData();
    }
  }

  // SERVICES FILE JSON TEXT
  String dataRenungan = '';
  List listTempData = [];

  void writeData() async {
    // read data proses
    String path = '/storage/emulated/0/Download/renunganpribadi.txt';
    bool directoryExists = await Directory(path).exists();
    bool fileExists = await File(path).exists();
    
    if (directoryExists || fileExists) {
      final contents = await File(path).readAsString();
      listTempData = []; //reset dulu
      setState(() {
        if (contents.isNotEmpty) {
          listTempData = json.decode(contents);
        }
      });
    }
    // end of read data proses

    // make json and add to string
    dataRenungan = ''; // reset string

    dataRenungan = dataRenungan + "[";
    if (widget.status == 'tambah') {
      if (listTempData.isNotEmpty) {
        for (int i = 0; i < listTempData.length; i++) {
          dataRenungan = dataRenungan + "{";
          dataRenungan = dataRenungan +
              '"Highlight":"' +
              listTempData[i]['Highlight'].toString() +
              '","Kitab":"' +
              listTempData[i]['Kitab'].toString() +
              '","Sabda":"' +
              listTempData[i]['Sabda'].toString() +
              '","Tindakan":"' +
              listTempData[i]['Tindakan'].toString() +
              '","Tagline":"' +
              listTempData[i]['Tagline'].toString() +
              '"}' +
              ",";
        }
      }
      dataRenungan = dataRenungan +
          "{" +
          '"Highlight":"' +
          ctr_highlight.text +
          '","Kitab":"' +
          text_read +
          '","Sabda":"' +
          ctr_sabda.text +
          '","Tindakan":"' +
          ctr_tindakan.text +
          '","Tagline":"' +
          ctr_tagline.text +
          '"}';
    } else if (widget.status == 'edit') {
      listTempData[widget.index]['Highlight'] = ctr_highlight.text.toString();
      listTempData[widget.index]['Kitab'] = text_read.toString();
      listTempData[widget.index]['Sabda'] = ctr_sabda.text.toString();
      listTempData[widget.index]['Tindakan'] = ctr_tindakan.text.toString();
      listTempData[widget.index]['Tagline'] = ctr_tagline.text.toString();
      for (int i = 0; i < listTempData.length; i++) {
        dataRenungan = dataRenungan + "{";
        dataRenungan = dataRenungan +
            '"Highlight":"' +
            listTempData[i]['Highlight'].toString() +
            '","Kitab":"' +
            listTempData[i]['Kitab'].toString() +
            '","Sabda":"' +
            listTempData[i]['Sabda'].toString() +
            '","Tindakan":"' +
            listTempData[i]['Tindakan'].toString() +
            '","Tagline":"' +
            listTempData[i]['Tagline'].toString() +
            '"}';
        if (listTempData.length != 1 && i != listTempData.length - 1) {
          dataRenungan = dataRenungan + ',';
        }
      }
    }
    dataRenungan = dataRenungan + "]";
    // end of add json to string

    // write string of json to local file
    File(path).writeAsString(dataRenungan);

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ListRenungan()));
  }

  void updateData() async {
    // read data proses
    String path = '/storage/emulated/0/Download/renunganpribadi.txt';
    bool directoryExists = await Directory(path).exists();
    bool fileExists = await File(path).exists();
    if (directoryExists || fileExists) {
      final contents = await File(path).readAsString();
      listTempData = []; //reset dulu
      setState(() {
        if (contents.isNotEmpty) {
          listTempData = json.decode(contents);
        }
      });
    }
    // end of read data proses

    setState(() {
      ctr_highlight.text = listTempData[widget.index]['Highlight'].toString();
      ctr_sabda.text = listTempData[widget.index]['Sabda'].toString();
      ctr_tindakan.text = listTempData[widget.index]['Tindakan'].toString();
      ctr_tagline.text = listTempData[widget.index]['Tagline'].toString();
    });
  }
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
            color: const Color.fromARGB(255, 140, 101, 58)),
        elevation: 0,
        title: Text(
          "Kembali",
          style: GoogleFonts.nunito(
              textStyle: const TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 140, 101, 58),
                  fontWeight: FontWeight.bold)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Tambah Renungan",
                  style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                          fontSize: 30,
                          color: Color.fromARGB(255, 85, 48, 29),
                          fontWeight: FontWeight.bold))),
              const SizedBox(
                height: 40,
              ),
              Text("Highlight Bacaan",
                  style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 85, 48, 29)))),
              const SizedBox(
                height: 10,
              ),
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
                      child: Text("Kejadian 1 : 2",
                          style: GoogleFonts.nunito(
                              textStyle: const TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 253, 255, 252)))),
                    ),
                    TextField(
                      controller: ctr_highlight,
                      cursorColor: Color.fromARGB(255, 85, 48, 29),
                      decoration: const InputDecoration(
                        fillColor: Color.fromARGB(255, 230, 225, 213),
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 85, 48, 29)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Color.fromARGB(255, 85, 48, 29)),
                        ),
                        contentPadding: EdgeInsets.all(10),
                      ),
                      maxLines: 5,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text("Sabda Tuhan Bagi Saya",
                  style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 85, 48, 29)))),
              TextField(
                controller: ctr_sabda,
                cursorColor: Color.fromARGB(255, 85, 48, 29),
                decoration: const InputDecoration(
                  fillColor: Color.fromARGB(255, 230, 225, 213),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 3, color: Color.fromARGB(255, 85, 48, 29)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: Color.fromARGB(255, 85, 48, 29)),
                  ),
                  contentPadding: EdgeInsets.all(10),
                ),
                maxLines: 7,
              ),
              const SizedBox(
                height: 30,
              ),
              Text("Tindakan Saya",
                  style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 85, 48, 29)))),
              TextField(
                controller: ctr_tindakan,
                cursorColor: Color.fromARGB(255, 85, 48, 29),
                decoration: const InputDecoration(
                  fillColor: Color.fromARGB(255, 230, 225, 213),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 3, color: Color.fromARGB(255, 85, 48, 29)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: Color.fromARGB(255, 85, 48, 29)),
                  ),
                  contentPadding: EdgeInsets.all(10),
                ),
                maxLines: 7,
              ),
              const SizedBox(
                height: 30,
              ),
              Text("Tagline",
                  style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 85, 48, 29)))),
              TextField(
                controller: ctr_tagline,
                cursorColor: Color.fromARGB(255, 85, 48, 29),
                decoration: InputDecoration(
                  fillColor: Color.fromARGB(255, 230, 225, 213),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 3, color: Color.fromARGB(255, 85, 48, 29)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: Color.fromARGB(255, 85, 48, 29)),
                  ),
                  contentPadding: EdgeInsets.all(10),
                ),
                maxLines: 1,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Pilih Warna",
                style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                    fontSize: 18,
                    color:Color.fromARGB(255, 85, 48, 29)
                  )
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      writeData();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 140, 101, 58),
                      elevation: 10,
                      padding: const EdgeInsets.all(5),
                    ),
                    child: (widget.status == 'tambah')
                        ? Text(
                          "Tambah Renungan",
                          style: GoogleFonts.nunito(
                                textStyle: const TextStyle(fontSize: 20),
                                fontWeight: FontWeight.bold),
                        )
                        : Text(
                          "Edit Renungan",
                          style: GoogleFonts.nunito(
                                textStyle: const TextStyle(fontSize: 20),
                                fontWeight: FontWeight.bold),
                        )
                  ),
                )
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}
