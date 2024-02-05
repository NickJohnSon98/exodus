import 'package:exodus/features/txApp/data/models/crypto_data_model.dart';
import 'package:exodus/features/txApp/data/repositories/hive_repo.dart';
import 'package:exodus/features/txApp/feature/home/components/crypto_builder/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoBuilderCubit extends Cubit<CryptoBuilderState> {
  CryptoBuilderCubit(List<CryptoDataModel> data)
      : super(CryptoBuilderState.initial(data)) {
    emit(state.copyWith(favorites: HiveRepo().favorites));
  }

  bool _isFavLoading = false;

  Future<void> toggleFavoriteId(String id) async {
    if (_isFavLoading) return;
    _isFavLoading = true;
    await HiveRepo().toggleFavoriteId(id);
    emit(state.copyWith(favorites: HiveRepo().favorites));
    _isFavLoading = false;
  }
}
