import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchAlkitab extends StatefulWidget {
  const SearchAlkitab({super.key});

  @override
  State<SearchAlkitab> createState() => _SearchAlkitabState();
}

class _SearchAlkitabState extends State<SearchAlkitab> {
  List ayat = List.generate(5, (i) => List.generate(2, (j) => ""));

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < 2; j++) {
        if (j == 0) {
          ayat[i][j] = "Kejadian 1:1";
        } else {
          ayat[i][j] =
              "1. Lorem ipsum dolor sit amet, consectetur adispiscing elit." +
                  " Aenean id arcu ut quisque id faucibus tempus, bibendum. Adispiscing dui proinlacus.";
        }
      }
    }
  }

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
        title: const Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 4, 10),
          child: TextField(
            cursorColor: Colors.white,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Allah",
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            padding: const EdgeInsets.fromLTRB(16, 12, 0, 0),
            color: const Color.fromARGB(255, 233, 224, 215),
            child: ListView.builder(
                itemCount: ayat.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Text(
                      ayat[index][0],
                      style: GoogleFonts.nunito(
                        textStyle: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                  );
                }),
            // Text(
            //   "Kejadian 1 : 1",
            //   style: GoogleFonts.nunito(
            //       textStyle: const TextStyle(
            //           fontSize: 18, fontWeight: FontWeight.w500)),
            // ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: ListView.builder(
                itemCount: ayat.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Text(
                      ayat[index][1],
                      style: GoogleFonts.nunito(
                        textStyle: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                  );
                }),
            // Text(
            //   "1. Lorem ipsum dolor sit amet, consectetur adispiscing elit." +
            //       " Aenean id arcu ut quisque id faucibus tempus, bibendum. Adispiscing dui proinlacus.",
            //   style: GoogleFonts.nunito(
            //       textStyle: TextStyle(
            //           fontSize: 18, color: Color.fromARGB(255, 95, 95, 95))),
            // ),
          ),
        ],
      ),
    );
  }
}
