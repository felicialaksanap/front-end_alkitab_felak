import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_get_alkitab_json/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginInput extends StatefulWidget {
  const LoginInput({super.key});

  @override
  State<LoginInput> createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
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
            color: const Color.fromARGB(255, 140, 101, 58)),
        elevation: 0,
        title: Text(
          "Kembali",
          style: GoogleFonts.nunito(
              textStyle: const TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 140, 101, 58),
                  fontWeight: FontWeight.bold)),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Selamat Datang !",
                  style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                          fontSize: 30,
                          color: Color.fromARGB(255, 85, 48, 29)))),
              Text("Masuk ke akun anda !",
                  style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 95, 95, 95)))),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    child: Image.asset('assets/images/starlogo.png'),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text("Email",
                  style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 85, 48, 29)))),
              Container(
                height: 30,
                child: TextField(
                  cursorColor: Color.fromARGB(255, 85, 48, 29),
                  decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 230, 225, 213),
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 3, color: Color.fromARGB(255, 85, 48, 29)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Color.fromARGB(255, 85, 48, 29)),
                    ),
                    hintText: 'example@email.com',
                    contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text("Kata Sandi",
                  style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 85, 48, 29)))),
              Container(
                height: 30,
                child: const TextField(
                  obscureText: true,
                  cursorColor: Color.fromARGB(255, 85, 48, 29),
                  decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 230, 225, 213),
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 3, color: Color.fromARGB(255, 85, 48, 29)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Color.fromARGB(255, 85, 48, 29)),
                    ),
                    hintText: '******',
                    contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Lupa kata sandi?",
                      style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 95, 95, 95),
                              decoration: TextDecoration.underline)),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage(statusLogin: true)));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 140, 101, 58),
                        elevation: 10,
                        padding: const EdgeInsets.all(5),
                      ),
                      child: Text(
                        "Masuk",
                        style: GoogleFonts.nunito(
                            textStyle: const TextStyle(fontSize: 20)),
                      ),
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
