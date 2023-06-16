import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  // ignore: unused_element
  static Future<String> _getAppDirectory() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    return appDocPath;
  }

  static Future saveToHive({required String name, required dynamic value, required String boxName}) async {
    //Initialize Hive
    // Hive.init(await _getAppDirectory());

    //Create a Hive box
    var box = await Hive.openBox(boxName);

    box.put(name, value);

    // box.close();
  }

  static Future retrieveFromHive({required String name, required String boxName}) async {
    //Initialize Hive
    // Hive.init(await _getAppDirectory());

    //Open Hive box
    var box = await Hive.openBox(boxName);

    var _result = await box.get(name);

    // box.close();

    return _result;
  }

  static Future removeFromHive({required String name, required String boxName}) async {
    var box = await Hive.openBox(boxName);
    await box.delete(name);
  }
}
