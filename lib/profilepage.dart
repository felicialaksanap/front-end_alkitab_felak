import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_get_alkitab_json/homepage.dart';
import 'package:flutter_get_alkitab_json/profile.dart';
import 'package:flutter_get_alkitab_json/settings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePageMenu extends StatefulWidget {
  const ProfilePageMenu({super.key});

  @override
  State<ProfilePageMenu> createState() => _ProfilePageMenuState();
}

class _ProfilePageMenuState extends State<ProfilePageMenu> {
  // SHARED PREFERENCES
  addBoolToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('statusLogin', false);
  }
  // END OF SHARED PREFERENNCES


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
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.account_circle_rounded, size: 100,),
                // Container(
                //   width: 100,
                //   height: 100,
                //   child: Image.asset('assets/images/person_icon.png')
                // )
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Admin Halo",
                  style: GoogleFonts.nunito(textStyle: TextStyle(fontSize: 18)),
                )
              ],
            ),
            const SizedBox(height: 20,),
            Container(
              height: 2,
              color: Colors.black,
            ),
            const SizedBox(height: 20,),
            ListTile(
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => ProfilePage())
                );
              },
              leading: Container(
                height: 40,
                width: 40,
                child: Image.asset('assets/images/person_icon.png')
              ),
              title: Text(
                "Data Pribadi",
                style: GoogleFonts.nunito(textStyle: TextStyle(fontSize: 18, color: Color.fromARGB(255, 85, 48, 29))),
              ),
              trailing: Text(
                ">",
                style: GoogleFonts.nunito(textStyle: TextStyle(fontSize: 18, color: Color.fromARGB(255, 85, 48, 29))),
              ),
            ),
            const SizedBox(height: 10,),
            ListTile(
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => SettingsPage())
                );
              },
              leading: Container(
                height: 40,
                width: 40,
                child: Image.asset('assets/images/person_icon.png')
              ),
              title: Text(
                "Pengaturan",
                style: GoogleFonts.nunito(textStyle: TextStyle(fontSize: 18, color: Color.fromARGB(255, 85, 48, 29))),
              ),
              trailing: Text(
                ">",
                style: GoogleFonts.nunito(textStyle: TextStyle(fontSize: 18, color: Color.fromARGB(255, 85, 48, 29))),
              ),
            ),
            const SizedBox(height: 10,),
            ListTile(
              onTap: () {
                addBoolToSF();
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => HomePage())
                );
              },
              leading: Container(
                height: 40,
                width: 40,
                child: Image.asset('assets/images/person_icon.png')
              ),
              title: Text(
                "Keluar",
                style: GoogleFonts.nunito(textStyle: TextStyle(fontSize: 18, color: Color.fromARGB(255, 85, 48, 29))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}