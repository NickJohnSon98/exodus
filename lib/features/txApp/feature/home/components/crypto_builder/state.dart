// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:exodus/features/txApp/data/models/crypto_data_model.dart';

class CryptoBuilderState extends Equatable {
  final List<CryptoDataModel> data;
  final Map<String, String> favorites;
  CryptoBuilderState({
    required this.data,
    required this.favorites,
  });

  @override
  List<Object> get props => [data, favorites];

  CryptoBuilderState copyWith({
    List<CryptoDataModel>? data,
    Map<String, String>? favorites,
  }) {
    return CryptoBuilderState(
      data: data ?? this.data,
      favorites: favorites ?? this.favorites,
    );
  }

  factory CryptoBuilderState.initial(List<CryptoDataModel> data) {
    return CryptoBuilderState(data: data, favorites: {});
  }
}
