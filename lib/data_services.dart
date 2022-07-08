import 'dart:convert';

import 'package:flutter/services.dart';
import './dataclass.dart';

class AlkitabServices {
  static Future<List<dataAlkitab>> getAlkitabFromJSON() async {
    try {
      final result = jsonDecode(await rootBundle.loadString('assets/Alkitab.json')) as List;

      return result.map((alkitab) => dataAlkitab.fromJson(alkitab)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}