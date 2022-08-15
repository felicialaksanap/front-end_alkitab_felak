import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_get_alkitab_json/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

class MergeAyat extends StatefulWidget {
  const MergeAyat({super.key});

  @override
  State<MergeAyat> createState() => _MergeAyatState();
}

class _MergeAyatState extends State<MergeAyat> {
  List ayat = List.generate(10, (i) => List.generate(3, (j) => ""));
  List items = [];
  List searchitems = [];

  double width = 20.0;
  double height = 7.0;
  bool valuevisible = false;
  // String image_path = 'assets/images/polygon_down.png';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    generateListAlkitab();
    // viewListAyat();
  }

  @override
  void generateListAlkitab() {
    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 3; j++) {
        if (j == 0) {
          ayat[i][j] = "Kejadian 1:1";
        } else if (j == 1) {
          ayat[i][j] =
            "1. Lorem ipsum dolor sit amet, consectetur adispiscing elit." +
            " Aenean id arcu ut quisque id faucibus tempus, bibendum. Adispiscing dui proinlacus.";
        } else {
          ayat[i][j] = "false";
        }
      }
    }
  }

  // @override
  // void viewListAyat () {
  //   for (int i = 0; i < 10; i++) {
  //     for (int j = 0; j < 3; j++) {
  //       print(ayat[i][j]);
  //       print("\n");
  //       print(ayat[i][j]);
  //       print("\n");
  //       print(ayat[i][j]);
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 140, 101, 58),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          }, 
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          )
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                // if (items.length < 5) {
                //   items.add("1 Tawarikh 2:1");
                // } else if (items.length == 5) {
                //   items.add("...");
                // }
                items.add("1 Tawarikh 2:1");
                searchitems.add("Matius 2:1");
              });
            }, 
            icon: const Icon(
              Icons.add_circle_outline,
              color: Colors.white,
            )
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16, top: 8),
            child: Text(
              "Ayat yang dibandingkan",
              style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 85, 48, 29))),
            ),
          ),

          Container(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(28, 4, 4, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color.fromARGB(255, 233, 224, 215),
                      ),
                      child: Row(
                        children: [
                          Text(items[index]),
                          const SizedBox(width: 20,),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                items.removeAt(index);
                              });
                            }, 
                            icon: const Icon(Icons.cancel_outlined)
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10,),
                  ],
                );
              }
            ),
          ),

          Container(
            padding: const EdgeInsets.only(left: 16, top: 8),
            child: Text(
              "Riwayat",
              style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 85, 48, 29))),
            ),
          ),

          Container(
            height: 60,
            // padding: const EdgeInsets.only(left: 16),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: searchitems.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(28, 4, 4, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color.fromARGB(255, 233, 224, 215),
                      ),
                      child: Row(
                        children: [
                          Text(searchitems[index]),
                          const SizedBox(width: 20,),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                searchitems.removeAt(index);
                              });
                            }, 
                            icon: const Icon(Icons.cancel_outlined)
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10,),
                  ],
                );
              }
            ),
          ),

          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: ayat.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        tileColor: const Color.fromARGB(255, 233, 224, 215),
                        onTap: () {
                          setState(() {
                              if (ayat[index][2] == "false") {
                                ayat[index][2] = "true";
                              } else if (ayat[index][2] == "true") {
                                ayat[index][2] = "false";
                              }
                            });
                        },
                        leading:Text(
                          ayat[index][0],
                          style: GoogleFonts.nunito(
                            textStyle: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ),
                        trailing: (ayat[index][2] == "true") 
                          ? Image.asset('assets/images/polygon_up.png')
                          : Image.asset('assets/images/polygon_down.png')
                      ),

                      Container(
                        padding: const EdgeInsets.fromLTRB(16, 12, 0, 12),
                        child: (ayat[index][2] == "true")
                        ? Visibility(
                          child: Text(
                            ayat[index][1],
                            style: GoogleFonts.nunito(
                              textStyle: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                          ),
                          visible: true,
                        )
                        : Visibility(
                          child: Text(
                            ayat[index][1],
                            style: GoogleFonts.nunito(
                              textStyle: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                          ),
                          visible: false,
                        ),
                      )
                    ],
                  );
                }
              )
            ),
          ),
        ],
      ),
    );
  }
}
