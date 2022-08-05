import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileManager {
  static FileManager? _instance;

  FileManager._internal() {
    _instance = this;
  }

  factory FileManager() => _instance ?? FileManager._internal();

  Future<String> get _directoryPath async {
    Directory? directory = await getExternalStorageDirectory();
    return directory!.path; 
  }

  Future<File> get _file async {
    final path = await _directoryPath;
    return File('$path/listcatatan.txt');
  }

  Future<String> readTextFile() async {
    String fileContent = 'Coba dulu';

    File file = await _file;

    if (await file.exists()) {
      try {
      fileContent = await file.readAsString();
      } catch (e) {
        print(e);
      }
    }

    return fileContent;
  }

  writeTextFile() async {
    
  }
}