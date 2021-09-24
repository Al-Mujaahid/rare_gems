import 'package:hive/hive.dart';

class LocalStorageService {
  Future get(boxKey, key) async {
    var box = Hive.box(boxKey);
    return box.get(key);
  }

  Future set(boxKey, key, value) async {
    var box = Hive.box(boxKey);
    return box.put(key, value);
  }

  Future unset(boxKey, key) async {
    var box = Hive.box(boxKey);
    return box.delete(key);
  }
}
