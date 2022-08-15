import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool status = false;
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
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Dark Mode",
                  style: GoogleFonts.nunito(textStyle: TextStyle(fontSize: 18, color: Color.fromARGB(255, 85, 48, 29))),
                ),
                FlutterSwitch(
                  width: 75.0,
                  height: 30.0,
                  // activeToggleColor: Colors.black,
                  toggleColor: Colors.black,
                  value: status, 
                  onToggle: (val) {
                    setState(() {
                      status = val;
                    });
                  }
                )
              ],
            ),
            const SizedBox(height: 10,),
            Container(
              height: 2,
              color: Colors.black,
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                Text(
                  "Font Size",
                  style: GoogleFonts.nunito(textStyle: TextStyle(fontSize: 18, color: Color.fromARGB(255, 85, 48, 29))),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Container(
              height: 2,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}