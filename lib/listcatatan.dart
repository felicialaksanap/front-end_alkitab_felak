import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class ListCatatan extends StatefulWidget {
  const ListCatatan({super.key});

  @override
  State<ListCatatan> createState() => _ListCatatanState();
}

class _ListCatatanState extends State<ListCatatan> {

  List itemJudul = List.generate(10, (index) => "Bumi berbentuk dan kosong");
  List itemKitab = List.generate(10, (index) => "Mazmur 9 : 2");
  List itemBody = List.generate(10, (index) => "Lorem ipsum dolor sit amet, consectetur adispiscing elit."
                                              + " Tellus dui eget habitant sed ornare enim amet accumsan" 
                                              + " egestas. Eu.");

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
        title: Text("Kembali", style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 140, 101, 58), fontWeight: FontWeight.bold)),),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Catatan", style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 140, 101, 58))),),
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
                            Text(itemJudul[index], style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 85, 48, 29))),),
                            const SizedBox(height: 5,),
                            Text(itemKitab[index], style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w300,color: Color.fromARGB(255, 85, 48, 29))),),
                            const SizedBox(height: 20,),
                            Text(itemBody[index], style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 85, 48, 29))),),
                          ],
                        ),
                      ),
                    );    
                  },
                  itemCount: itemJudul.length,
                )
              ),
            ),
          ],
        ),
      ),
      // Container (
      //   padding: const EdgeInsets.all(24.0),
      //   child: Column(
      //     children: [
      //       const TextField(
      //         cursorColor: Color.fromARGB(255, 95, 95, 95),
      //         decoration: InputDecoration(
      //           fillColor: Color.fromARGB(255, 253, 255, 252),
      //           filled: true,
      //           border: OutlineInputBorder(
      //             borderSide: BorderSide(width: 3, color: Color.fromARGB(255, 85, 48, 29)),
      //           ),
      //           focusedBorder: OutlineInputBorder(
      //             borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 85, 48, 29)),
      //           ),
      //           hintText: 'Cari Taglines',
      //           contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5)
      //         ),
      //       ),

      //       Container(
      //         child: ListView.builder(
      //           itemBuilder: (context, index) {
      //             return Card(
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Text(itemJudul[index]),
      //                   Text(itemKitab[index]),
      //                   Text(itemBody[index]),
      //                 ],
      //               ),
      //             );    
      //           },
      //           itemCount: itemJudul.length,
      //         )
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}