import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_get_alkitab_json/listalkitab.dart';
import 'package:flutter_get_alkitab_json/listalkitabtemp.dart';
import 'package:flutter_get_alkitab_json/listcatatan.dart';
import 'package:flutter_get_alkitab_json/listrenungan.dart';
import 'package:flutter_get_alkitab_json/loginpage.dart';
import 'package:flutter_get_alkitab_json/mergeayat.dart';
import 'package:flutter_get_alkitab_json/profile.dart';
import 'package:flutter_get_alkitab_json/profilepage.dart';
import 'package:flutter_get_alkitab_json/searchalkitab.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  // final bool statusLogin;
  const HomePage({
    super.key, 
    // required this.statusLogin
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // SHARED PREFENCES
  late bool statusLogin;

  // addBoolToSF() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setBool('statusLogin', statusLogin);
  // }

  getBoolValueSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Return bool
    statusLogin = prefs.getBool('statusLogin') ?? false;
    return statusLogin;
  }
  // END OF SHARED PREFERENCES

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBoolValueSF();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 140, 101, 58),
        elevation: 0,
        title: TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ListAlkitab()));
          },
          child: Text("Kejadian 1",
              style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white))),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: dataAlkitabTemp.isiAlkitab.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dataAlkitabTemp.isiAlkitab[index].alkitab,
                  style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 95, 95, 95))),
                ),
                const SizedBox(height: 10,),
              ],
            );
          }
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 55,
                    color: const Color.fromARGB(255, 140, 101, 58),
                    child: Row(  // close
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.clear,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  ListTile( // profile
                    leading: Container(
                        width: 40,
                        height: 40,
                        child: 
                        Image.asset('assets/images/person_icon.png'),
                    ),
                    title: Text(
                      "Profile",
                      style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 140, 101, 58))),
                    ),
                    onTap: () {
                      if (statusLogin == false) {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage())
                        );
                      } else if (statusLogin == true) {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ProfilePageMenu())
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 10,),
                  ListTile(
                    leading:Container(
                      width: 40,
                      height: 40,
                      child: Image.asset("assets/images/add_icon.png"),
                    ),
                    title: Text(
                      "Gabungin Ayat",
                      style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 140, 101, 58))),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MergeAyat()));
                    },
                  ),
                  const SizedBox(height: 10,),
                  ListTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                      child: Image.asset("assets/images/catatan_icon.png"),
                    ),
                    title: Text(
                      "Catatan",
                      style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 140, 101, 58))),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListCatatan()));
                    },
                  ),
                  const SizedBox(height: 10,),
                  ListTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                      child: 
                      Image.asset("assets/images/alkitab_icon.png"),
                    ),
                    title: Text(
                      "Renungan",
                      style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 140, 101, 58))),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListRenungan()));
                    },
                  ),
                  const SizedBox(height: 10,),
                  ListTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                      child: Image.asset("assets/images/search_icon.png"),
                    ),
                    title: Text(
                      "Search",
                      style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 140, 101, 58))),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchAlkitab()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
