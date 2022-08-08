import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_get_alkitab_json/listcatatan.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';

class CatatanPage extends StatefulWidget {
  const CatatanPage({super.key});

  @override
  State<CatatanPage> createState() => _CatatanPageState();
}

class _CatatanPageState extends State<CatatanPage> {
  // final _ctrKitab = TextEditingController();
  final ctr_highlight = TextEditingController();
  final ctr_catatan = TextEditingController();
  final ctr_tagline = TextEditingController();
  String text_read = "";

  List<String> listhighlight = [];
  List<String> listkitab = [];
  List<String> listbody = [];

  // void tambahData() {
  //   setState(() {
  //     listhighlight.add(_ctrHighlight.text);
  //     listkitab.add("Kejadian 1:2");
  //     listbody.add(_ctrBody.text);
  //   });
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    // _ctrHighlight.dispose();
    // // _ctrKitab.dispose();
    // _ctrBody.dispose();
    super.dispose();
  }

  String dataCatatan = '';
  // SERVICES SAVE TO JSON
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('/storage/emulated/0/Download/catatanpribadi.txt');
  }

  Future<File> saveToFile() async {
    final file = await _localFile;
    return file.writeAsString(ctr_highlight.text);
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
              Text(text_read),
              const SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      saveToFile();
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => ListCatatan(highlight: listhighlight, kitab: listkitab, body: listbody))
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 140, 101, 58),
                      elevation: 10,
                      padding: const EdgeInsets.all(5),
                    ),
                    child: Text("Buat Catatan", style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 20), fontWeight: FontWeight.bold),),
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