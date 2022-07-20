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
  List items = List.generate(10, (index) => "Matius 2");
  List searchitems = [];

  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Color.fromARGB(255, 85, 48, 29),
            padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    color: Colors.white,
                    // child: GridView.builder(
                    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //     crossAxisCount: 2,
                    //   ),
                    //   itemCount: 4,
                    //   itemBuilder: (context, index) {
                    //     return Text("index $index");
                    //   }
                    // ),
                    // child: GridView.builder(
                    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    //     crossAxisCount: 2,
                    //     // childAspectRatio: 0.75,
                    //     crossAxisSpacing: 10,
                    //     mainAxisSpacing: 10,
                    //   ),
                    //   itemCount: searchitems.length,
                    //   itemBuilder: (BuildContext context, int index) {
                    //     return Container(
                    //       padding: EdgeInsets.fromLTRB(16, 4, 4, 0),
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(50),
                    //         color: Color.fromARGB(255, 233, 224, 215),
                    //       ),
                    //       child: Row(
                    //         children: [
                    //           Text(searchitems[index]),
                    //           IconButton(
                    //             onPressed: () {
                    //               setState(() {
                    //                 searchitems.removeAt(index);
                    //               });
                    //             },
                    //             icon: Icon(Icons.cancel_outlined)
                    //           ),
                    //         ],
                    //       ),
                    //     );
                    //   }
                    // ),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              searchitems.add("Matius 2");
                            });
                          },
                          icon: const Icon(
                            Icons.add_circle_outline,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.search,
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 8),
            child: Text(
              "Riwayat",
              style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 85, 48, 29))),
            ),
          ),
          Container(
            height: 60,
            padding: EdgeInsets.only(left: 16),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(16, 4, 4, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromARGB(255, 233, 224, 215),
                      ),
                      child: Row(
                        children: [
                          Text(items[index]),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.cancel_outlined)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                );
              },
            ),
          ),
          // Expanded(
          //   child: Container(
          //     padding: EdgeInsets.only(left: 16, right: 16),
          //     child: GridView.builder(
          //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //         crossAxisCount: 2,
          //         // childAspectRatio: 0.75,
          //         crossAxisSpacing: 10,
          //         mainAxisSpacing: 10,
          //       ),
          //       itemCount: searchitems.length,
          //       itemBuilder: (BuildContext context, int index) {
          //         return Container(
          //           padding: EdgeInsets.fromLTRB(16, 4, 4, 0),
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(50),
          //             color: Color.fromARGB(255, 233, 224, 215),
          //           ),
          //           child: Row(
          //             children: [
          //               Text(searchitems[index]),
          //               IconButton(
          //                 onPressed: () {
          //                   setState(() {
          //                     searchitems.removeAt(index);
          //                   });
          //                 },
          //                 icon: Icon(Icons.cancel_outlined)
          //               ),
          //             ],
          //           ),
          //         );
          //       }
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  // Widget _cardRiwayat() {
  //   return Container(
  //     padding: EdgeInsets.fromLTRB(16, 4, 4, 0),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(50),
  //       color: Color.fromARGB(255, 233, 224, 215),
  //     ),
  //     child: Row(
  //       children: [
  //         Text("Matius 2"),
  //         IconButton(
  //             onPressed: () {
  //               // deleteRiwayat(ind)
  //               // riwayatPencarian.removeAt(index);
  //             },
  //             icon: Icon(Icons.cancel_outlined)),
  //       ],
  //     ),
  //   );
  // }
}
