import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? image;

  Future pickImage(ImageSource source) async {
    try { 
      final image = await ImagePicker().pickImage(source: source );
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  TextEditingController _ctrNamaDepan = TextEditingController();
  TextEditingController _ctrNamaBelakang = TextEditingController();
  TextEditingController _ctrEmail = TextEditingController();
  TextEditingController _ctrBiografi = TextEditingController();
  TextEditingController _ctrDetailLain = TextEditingController();

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                image != null 
                ? ClipOval(
                  child: Image.file(
                    image!,
                    width: 160,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                )
                : Icon(
                  Icons.account_circle_outlined,
                  color: Color.fromARGB(255, 140, 101, 58),
                  size: 100,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context, 
                      builder: (BuildContext context) {
                        return Container(
                          height: 150,
                          color: const Color.fromARGB(255, 233, 224, 215),
                          padding: const EdgeInsets.only(top: 30),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        pickImage(ImageSource.gallery);
                                        Navigator.pop(context);
                                      }, 
                                      child: Image.asset(
                                        'assets/images/fromgallery.png',
                                        width: 40,
                                        height: 40,
                                      ),
                                    ),
                                    Text(
                                      "Pilih Dari Album",
                                      style: GoogleFonts.roboto(textStyle: const TextStyle(
                                        fontSize: 15,
                                        color: Color.fromARGB(255, 85, 48, 29)
                                      )),
                                    )
                                  ],
                                ),
                                const SizedBox(width: 40,),
                                Column(
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        pickImage(ImageSource.camera);
                                        // Navigator.pop(context);
                                      },
                                      child: Image.asset(
                                        'assets/images/fromcamera.png',
                                        width: 40,
                                        height: 40,
                                      ),
                                    ),
                                    Text(
                                      "Mengambil Foto",
                                      style: GoogleFonts.roboto(textStyle: const TextStyle(
                                        fontSize: 15,
                                        color: Color.fromARGB(255, 85, 48, 29)
                                      )),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    );
                  }, 
                  child: Text("Ganti Foto", style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 14, color: Color.fromARGB(255, 95, 95, 95), decoration: TextDecoration.underline)),),
                ),
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
            const TextField(
              maxLines: 3,
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
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 140, 101, 58),
                      elevation: 10,
                      padding: const EdgeInsets.all(5),
                    ),
                    child: Text("Save", style: GoogleFonts.nunito(textStyle: const TextStyle(fontSize: 20)),),
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
