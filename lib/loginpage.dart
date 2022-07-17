import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_get_alkitab_json/logininput.dart';
import 'package:flutter_get_alkitab_json/register.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              child: Image.asset('assets/images/logo.png'),
            ),
            const SizedBox(height: 10,),
            Text(
              "Belum Tahu",
              style: GoogleFonts.nunito(
                textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 85, 48, 29)),
              ),
            ),
            const SizedBox(height: 20,),
            Text(
              "Selamat Datang di Aplikasi Alkitab !", 
              style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 20, color: Color.fromARGB(255, 95, 95, 95))),
            ),
            const SizedBox(height: 50,),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => LoginInput()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 140, 101, 58),
                  elevation: 10,
                  padding: const EdgeInsets.all(5),
                ),
                child: Text("Masuk", style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 20)),),
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 230, 225, 213),
                  side: const BorderSide(width: 2, color: Color.fromARGB(255, 85, 48, 29)),
                  elevation: 10,
                  padding: const EdgeInsets.all(5),
                ),
                child: Text("Daftar", style: GoogleFonts.nunito(textStyle: const TextStyle(color: Color.fromARGB(255, 85, 48, 29), fontWeight: FontWeight.bold, fontSize: 20)),),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}