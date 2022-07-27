import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class MergeAyat extends StatefulWidget {
  const MergeAyat({super.key});

  @override
  State<MergeAyat> createState() => _MergeAyatState();
}

class _MergeAyatState extends State<MergeAyat> {
  List ayat = List.generate(10, (i) => List.generate(2, (j) => ""));
  List items = [];
  List searchitems = [];

  double width = 20.0;
  double height = 7.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    generateListAlkitab();
    viewListAyat();
  }

  @override
  void generateListAlkitab() {
    for (int i = 0; i < 10; i++) {
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
  void viewListAyat () {
    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < 2; j++) {
        print(ayat[i][j]);
        print("\n");
        print(ayat[i][j]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                color: const Color.fromARGB(255, 140, 101, 58),
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                child: Row (
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      }, 
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )
                    ),

                    Expanded(
                      child: Container(
                        // padding: const EdgeInsets.only(left: 4,right: ),
                        child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 10,
                            childAspectRatio: width / height,
                          ),
                          itemCount: items.length, 
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.fromLTRB(5, 4, 0, 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: const Color.fromARGB(255, 233, 224, 215),
                              ),
                              child: Row(
                                children: [
                                  Text(items[index]),
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
                            );
                          }
                        ),
                      ),
                    ),

                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (items.length < 5) {
                            items.add("Matius 2:1");
                          } else if (items.length == 5) {
                            items.add("...");
                          }
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
              ),
            ],
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
            padding: const EdgeInsets.only(left: 16),
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
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.fromLTRB(16, 12, 0, 12),
                        color: const Color.fromARGB(255, 233, 224, 215),
                        child: Text(
                          ayat[index][0],
                          style: GoogleFonts.nunito(
                            textStyle: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(16, 12, 0, 12),
                        child: Text(
                          ayat[index][1],
                          style: GoogleFonts.nunito(
                            textStyle: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500)),
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
