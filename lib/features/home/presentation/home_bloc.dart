import 'package:exodus/app_data/app_data.dart';
import 'package:exodus/features/auth/domain/auth_service.dart';
import 'package:exodus/features/crypt/domain/crypt.dart';
import 'package:exodus/features/currency/domain/custom_currency.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

abstract class HomeBloc extends State<HomeScreen> {
  final AuthService authService = AuthService();

  int selectedTabIndex = 0;
  int selectedBuyScreen = 0;

  int money = 100;

  List<CustomCurrency> currencies = [];
  List<Crypt> crypts = [];

  Crypt? selectedCrypt;
  CustomCurrency? selectedCurrency;

  void onTapTab(int index) {
    setState(() {
      selectedTabIndex = index;
    });
    print(" selectedTabIndex $selectedTabIndex");
  }

  void onBuyTapTab(int index) {
    setState(() {
      selectedBuyScreen = index;
    });
    print(" selectedBuyScreen $selectedBuyScreen");
  }

  String get mainCurrency {
    return authService.getSelectCurrency()!.symbol;
  }

  String get wallet {
    return AppData.utils.doubleToTwoValues(authService.getWallet()!);
  }

  @override
  void initState() {
    crypts = authService.getCrypts()!;
    selectedCrypt = crypts[0];
    currencies = authService.getCurrencies();
    selectedCurrency = currencies[0];
    super.initState();
  }
}
