import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_get_alkitab_json/listalkitab.dart';
import 'package:flutter_get_alkitab_json/listcatatan.dart';
import 'package:flutter_get_alkitab_json/listrenungan.dart';
import 'package:flutter_get_alkitab_json/mergeayat.dart';
import 'package:flutter_get_alkitab_json/profile.dart';
import 'package:flutter_get_alkitab_json/searchalkitab.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 140, 101, 58),
        elevation: 0,
        title: TextButton(
          onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => ListAlkitab())
            );
          },
          child: Text(
            "Kejadian 2", 
            style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white))
          ),
        ),
      ),
      endDrawer: Drawer(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: <Widget> [
                  Container(
                    height: 55,
                    color: const Color.fromARGB(255, 140, 101, 58),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          }, 
                          icon: Icon(Icons.clear, color: Colors.white,))
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Container(
                      width: 25,
                      height: 25,
                      child: Image.asset('assets/images/person_icon.png')
                    ),
                    // Icon(
                    //   Icons.account_circle_outlined,
                    //   color: Color.fromARGB(255, 140, 101, 58)),
                    title: Text("Profile", style: GoogleFonts.roboto(textStyle: const TextStyle(fontSize: 14, color: Color.fromARGB(255, 140, 101, 58))),),
                    onTap: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => ProfilePage())
                      );
                    },
                  ),
                  ListTile(
                    leading: const  Icon(
                      Icons.add_circle_outline,
                      color: Color.fromARGB(255, 140, 101, 58)),
                    title: Text("Gabungin Ayat", style: GoogleFonts.roboto(textStyle: const TextStyle(fontSize: 14, color: Color.fromARGB(255, 140, 101, 58))),),
                    onTap: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => MergeAyat())
                      );
                    },
                  ),
                  ListTile(
                    leading: const  Icon(
                      Icons.assignment_outlined,
                      color: Color.fromARGB(255, 140, 101, 58)),
                    title: Text("Catatan", style: GoogleFonts.roboto(textStyle: const TextStyle(fontSize: 14, color: Color.fromARGB(255, 140, 101, 58))),),
                    onTap: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => ListCatatan())
                      );
                    },
                  ),
                  ListTile(
                    leading: const  Icon(
                      Icons.book,
                      color: Color.fromARGB(255, 140, 101, 58)),
                    title: Text("Renungan", style: GoogleFonts.roboto(textStyle: const TextStyle(fontSize: 14, color: Color.fromARGB(255, 140, 101, 58))),),
                    onTap: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => ListRenungan())
                      );
                    },
                  ),
                  ListTile(
                    leading: const  Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 140, 101, 58)),
                    title: Text("Search", style: GoogleFonts.roboto(textStyle: const TextStyle(fontSize: 14, color: Color.fromARGB(255, 140, 101, 58))),),
                    onTap: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => SearchAlkitab())
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}