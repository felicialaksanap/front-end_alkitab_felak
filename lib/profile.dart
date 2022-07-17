import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_get_alkitab_json/editprofile.dart';
import 'package:flutter_get_alkitab_json/loginpage.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
        actions: [
          IconButton(
          onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => LoginPage())
            );
          },
          icon: const Icon(Icons.power_settings_new_rounded),
          color: const Color.fromARGB(255, 140, 101, 58)
        ),
        ],
        elevation: 0,
        title: Text("Kembali", style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 140, 101, 58), fontWeight: FontWeight.bold)),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const[
                Icon(
                  Icons.account_circle_outlined,
                  color: Color.fromARGB(255, 140, 101, 58),
                  size: 100,
                )
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Nama Depan", style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 85, 48, 29)))),
                      Container(
                        height: 30,
                        child: const TextField(
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
                            hintText: 'nama depan',
                            contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Nama Belakang", style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 85, 48, 29)))),
                      Container(
                        height: 30,
                        child: const TextField(
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
                            hintText: 'nama belakang',
                            contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5)
                          ),
                        ),
                      ),
                    ],
                  )
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Text("Email", style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 85, 48, 29)))),
            Container(
              height: 30,
              child: const TextField(
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
                  hintText: 'example@email.com',
                  contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5)
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Text("Biografi", style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 85, 48, 29)))),
            Container(
              height: 30,
              child: const TextField(
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
                  hintText: 'Lorem Ipsum',
                  contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5)
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Text("Detail Lain", style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 85, 48, 29)))),
            Container(
              height: 30,
              child: const TextField(
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
                  hintText: 'Lorem Ipsum',
                  contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5)
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context, MaterialPageRoute(builder: (context) => EditProfile()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 140, 101, 58),
                      elevation: 10,
                      padding: const EdgeInsets.all(5),
                    ),
                    child: Text("Edit", style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 20)),),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}