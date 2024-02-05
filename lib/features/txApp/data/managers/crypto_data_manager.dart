import 'package:exodus/features/txApp/data/models/crypto_data_model.dart';
import 'package:exodus/features/txApp/data/repositories/crypto_data_repo.dart';

class CryptoDataManager {
  CryptoDataManager._();
  static final _instance = CryptoDataManager._();
  factory CryptoDataManager() {
    return _instance;
  }

  List<CryptoDataModel> data = [];

  Future<void> defineData() async {
    data = await CryptoDataRepo().get();
  }
}
