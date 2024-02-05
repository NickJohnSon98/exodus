import 'package:dio/dio.dart';
import 'package:exodus/features/txApp/data/models/crypto_data_model.dart';

class CryptoDataRepo {
  CryptoDataRepo._();
  static final _instance = CryptoDataRepo._();
  factory CryptoDataRepo() {
    return _instance;
  }

  Future<List<CryptoDataModel>> get() async {
    final resp = await Dio().get(
      "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&sparkline=true",
    );
    final data = List<Map<String, dynamic>>.from(resp.data);
    final converted = data.map((e) => CryptoDataModel.fromMap(e)).toList();
    return converted;
  }
}
