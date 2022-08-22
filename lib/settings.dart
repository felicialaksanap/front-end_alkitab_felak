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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    "Dark Mode",
                    style: GoogleFonts.nunito(textStyle: TextStyle(fontSize: 18, color: Color.fromARGB(255, 85, 48, 29))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: FlutterSwitch(
                    width: 60.0,
                    height: 30.0,
                    inactiveColor: Colors.black,
                    activeColor: Color.fromARGB(255, 0, 206, 77),
                    value: status, 
                    onToggle: (val) {
                      setState(() {
                        status = val;
                      });
                    }
                  ),
                )
              ],
            ),
            const SizedBox(height: 10,),
            Container(
              height: 2,
              color: Colors.black,
            ),
            const SizedBox(height: 20,),
            ListTile(
              onTap: () {
                showModalBottomSheet(
                  context: context, 
                  builder: (BuildContext context) {
                    return Container(
                      height: 250,
                      color: const Color.fromARGB(255, 233, 224, 215),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              "Small",
                              style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 10, color: Color.fromARGB(255, 85, 48, 29))),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              "Medium",
                              style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 14, color: Color.fromARGB(255, 85, 48, 29))),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              "Large",
                              style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 85, 48, 29))),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              "Extra Large",
                              style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 22, color: Color.fromARGB(255, 85, 48, 29))),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                );
              },
              title: Text(
                "Font Size",
                style: GoogleFonts.nunito(textStyle: TextStyle(fontSize: 18, color: Color.fromARGB(255, 85, 48, 29))),
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Text(
                  ">",
                  style: GoogleFonts.nunito(textStyle: TextStyle(fontSize: 18, color: Color.fromARGB(255, 85, 48, 29))),
                ),
              ),
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