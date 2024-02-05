import 'package:exodus/features/txApp/data/managers/crypto_data_manager.dart';
import 'package:exodus/features/txApp/data/models/crypto_data_model.dart';
import 'package:exodus/features/txApp/data/repositories/hive_repo.dart';
import 'package:exodus/features/txApp/feature/home/state_managment/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  void getFavorites() {
    emit(state.copyWith(favoriteCriptosIds: HiveRepo().favorites));
  }

  Future<void> getCryptoData(BuildContext context) async {
    emit(state.copyWith(
        isLoading: true, favoriteCriptosIds: HiveRepo().favorites));
    List<CryptoDataModel> data = CryptoDataManager().data;
    if (data.isEmpty) {
      await () async {
        await CryptoDataManager().defineData();
        data = CryptoDataManager().data;
        emit(state.copyWith(isLoading: false, cryptoData: data));
      }()
          .catchError((e) {
        print(e);
      });
    } else {
      emit(state.copyWith(isLoading: false, cryptoData: data));
    }
  }
}
