import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_get_alkitab_json/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
        elevation: 0,
        title: Text("Kembali", style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 140, 101, 58), fontWeight: FontWeight.bold)),),
      ),
      body: SingleChildScrollView (
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Daftar Akun Anda", style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 30, color: Color.fromARGB(255, 85, 48, 29)))),
              Text("Daftarkan akun anda disini !", style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 95, 95, 95)))),
              const SizedBox(height: 100,),
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
              const SizedBox(height: 20,),
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
              const SizedBox(height: 20,),
              Text("Kata Sandi", style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 85, 48, 29)))),
              Container(
                height: 30,
                child: const TextField(
                  obscureText: true,
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
                    hintText: '******',
                    contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5)
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Text("Ulangi Kata Sandi", style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 85, 48, 29)))),
              Container(
                height: 30,
                child: const TextField(
                  obscureText: true,
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
                    hintText: '******',
                    contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5)
                  ),
                ),
              ),
              const SizedBox(height: 100,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context, MaterialPageRoute(builder: (context) => HomePage(statusLogin: true)));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 140, 101, 58),
                        elevation: 10,
                        padding: const EdgeInsets.all(5),
                      ),
                      child: Text("Daftar", style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 20)),),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    
  }
}