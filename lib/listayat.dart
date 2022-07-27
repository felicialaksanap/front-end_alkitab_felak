import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_get_alkitab_json/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

class ListAyat extends StatefulWidget {
  const ListAyat({super.key});

  @override
  State<ListAyat> createState() => _ListAyatState();
}

class _ListAyatState extends State<ListAyat> {
  List ayat = List.generate(30, (index) => "$index");

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
          "Ayat", 
          style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white))
        ),
      ),
      body: Container (
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, 
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ), 
          itemCount: ayat.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 233, 224, 215)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => HomePage(statusLogin: false,))
                      );
                    }, 
                    child: Text(ayat[index]),
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