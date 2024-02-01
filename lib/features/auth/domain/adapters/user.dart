import 'package:hive/hive.dart';
import 'package:exodus/features/auth/domain/adapters/transaction.dart';
import 'package:exodus/features/currency/domain/custom_currency.dart';

import 'portfolio.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  String address;

  @HiveField(1)
  List<Transaction>? transactions;

  @HiveField(2)
  List<CustomCurrency> currencies;

  @HiveField(3)
  List<String>? nft;

  @HiveField(4)
  Portfolio portfolio;

  User({
    required this.address,
    this.transactions,
    this.nft,
    required this.portfolio,
    required this.currencies,
  });
}
