import 'package:exodus/features/txApp/data/models/crypto_data_model.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class HomeState extends Equatable {
  final bool isLoading;
  final List<CryptoDataModel> cryptoData;
  final Map<String, String> favoriteCriptosIds;
  const HomeState({
    required this.isLoading,
    required this.cryptoData,
    required this.favoriteCriptosIds,
  });

  List<CryptoDataModel> get top10 {
    if (cryptoData.isEmpty) return [];
    final sorted = List<CryptoDataModel>.from(cryptoData)
      ..sort((a, b) => b.currentPrice.compareTo(a.currentPrice));
    if (sorted.length < 10) return sorted;
    return sorted.sublist(0, 10);
  }

  List<CryptoDataModel> get favorites {
    return cryptoData
        .where((element) => favoriteCriptosIds[element.id] != null)
        .toList();
  }

  @override
  List<Object> get props => [isLoading, cryptoData, favoriteCriptosIds];

  HomeState copyWith({
    bool? isLoading,
    List<CryptoDataModel>? cryptoData,
    Map<String, String>? favoriteCriptosIds,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      cryptoData: cryptoData ?? this.cryptoData,
      favoriteCriptosIds: favoriteCriptosIds ?? this.favoriteCriptosIds,
    );
  }

  factory HomeState.initial() {
    return const HomeState(
      isLoading: false,
      cryptoData: [],
      favoriteCriptosIds: {},
    );
  }
}
