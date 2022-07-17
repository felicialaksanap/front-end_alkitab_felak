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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 140, 101, 58),
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.fromLTRB(16, 4, 4, 10),
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
    );
  }
}