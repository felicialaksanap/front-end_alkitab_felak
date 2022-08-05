import 'package:flutter/material.dart';
import 'package:flutter_get_alkitab_json/listcatatan.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class CatatanPage extends StatefulWidget {
  const CatatanPage({super.key});

  @override
  State<CatatanPage> createState() => _CatatanPageState();
}

class _CatatanPageState extends State<CatatanPage> {
  final _ctrHighlight = TextEditingController();
  // final _ctrKitab = TextEditingController();
  final _ctrBody = TextEditingController();

  List<String> listhighlight = [];
  List<String> listkitab = [];
  List<String> listbody = [];

  void tambahData() {
    setState(() {
      listhighlight.add(_ctrHighlight.text);
      listkitab.add("Kejadian 1:2");
      listbody.add(_ctrBody.text);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _ctrHighlight.dispose();
    // _ctrKitab.dispose();
    _ctrBody.dispose();
    super.dispose();
  }

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
                width: MediaQuery.of(context).size.width,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 140, 101, 58),
                ),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Kejadian 1 : 2", style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 12, color: Color.fromARGB(255, 253, 255, 252)))),
                    const SizedBox(height: 10,),
                    TextField(
                      controller: _ctrHighlight,
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
              const SizedBox(height: 40,),
              Text("Catatan", style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 85, 48, 29)))),
              TextField(
                controller: _ctrBody,
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
              const SizedBox(height: 40,),
              Text("Tagline", style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 85, 48, 29)))),
              const TextField(
                cursorColor: Color.fromARGB(255, 85, 48, 29),
                decoration: InputDecoration(
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
                maxLines: 1,
              ),
              const SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          tambahData();
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
                        child: Text("Create", style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 20), fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}