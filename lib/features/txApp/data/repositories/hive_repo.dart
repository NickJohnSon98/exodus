import 'package:hive_flutter/hive_flutter.dart';

class HiveRepo {
  HiveRepo._();
  static final _instance = HiveRepo._();
  factory HiveRepo() {
    return _instance;
  }

  bool get isFirstOpen {
    try {
      return _db?.get("is_first_open") ?? true;
    } catch (e) {
      return true;
    }
  }

  Map<String, String> get favorites {
    return Map<String,String>.from(_db?.get("favorites") ?? {});
  }

  Box? _db;

  Future<void> init() async {
    try {
      await Hive.initFlutter();
      _db = await Hive.openBox("crypto_app");
    } catch (e) {}
  }

  Future<void> setIsNotFirstOpen() async {
    await _db?.put("is_first_open", false);
  }

  Future<void> toggleFavoriteId(String id) async {
    Map<String, String> fav = Map<String, String>.from(favorites);
    if (fav[id] != null) {
      fav.remove(id);
    } else {
      fav[id] = id;
    }
    await _db?.put("favorites", fav);
  }
}
