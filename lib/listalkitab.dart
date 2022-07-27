import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_get_alkitab_json/listalkitabtemp.dart';
import 'package:flutter_get_alkitab_json/listpasal.dart';
import 'package:google_fonts/google_fonts.dart';

class ListAlkitab extends StatefulWidget {
  const ListAlkitab({super.key});

  @override
  State<ListAlkitab> createState() => _ListAlkitabState();
}

class _ListAlkitabState extends State<ListAlkitab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 140, 101, 58),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Alkitab", 
          style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white))
        ),
      ),
      body: Container (
          padding: const EdgeInsets.all(8),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5, 
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ), 
            itemCount: dataNamaKitab.isiNamaKitab.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 233, 224, 215)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => ListPasal())
                        );
                      }, 
                      child: Text(dataNamaKitab.isiNamaKitab[index].alkitab),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
    );
  }
}