import 'package:exodus/app_data/app_data.dart';
import 'package:exodus/features/auth/domain/auth_service.dart';
import 'package:exodus/features/crypt/domain/crypt.dart';
import 'package:exodus/features/currency/domain/custom_currency.dart';
import 'package:exodus/features/settings/domain/settings_service.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

abstract class HomeBloc extends State<HomeScreen> {
  final AuthService authService = AuthService();
  final SettingsService settingsService = SettingsService();
  final ScrollController scrollController = ScrollController();

  int selectedTabIndex = 0;
  int selectedBuyScreen = 0;
  int selectedSettingsScreen = 0;

  int money = 100;
  double buyAmount = 0;
  double swapAmount = 0;
  double buyMoney = 0;
  double swapMoney = 0;

  List<CustomCurrency> currencies = [];
  List<Crypt> crypts = [];
  List<Crypt> swapCrypts = [];
  List<Crypt> sortedCrypts = [];

  String selectedHistoryType = "All type";
  List<String> historyType = [
    "All type",
    "First type",
    "Second type",
  ];

  String selectedHistoryAssets = "All assets";
  List<String> historyAssets = [
    "All assets",
    "First asset",
    "Second asset",
  ];

  Crypt? selectedCrypt;
  Crypt? selectedCryptBuy;
  Crypt? selectedWallet;
  CustomCurrency? selectedCurrency;

  bool isWithBalance = false;
  bool isFavorite = false;

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

  void onSettingsTapTab(int index) {
    setState(() {
      selectedSettingsScreen = index;
    });
    print(" selectedSettingsScreen $selectedSettingsScreen");
  }

  String get mainCurrency {
    return authService.getSelectCurrency()!.symbol;
  }

  String get wallet {
    return AppData.utils.doubleToTwoValues(authService.getWallet()!);
  }

  void checkTable(bool isWithBalance, bool isFavorite) {
    if (isWithBalance && !isFavorite) {
      sortedCrypts = crypts.where((element) => element.amount != 0.0).toList();
    } else if (isFavorite && !isWithBalance) {
      sortedCrypts =
          crypts.where((element) => element.isFavorite == true).toList();
    } else if (isFavorite && isWithBalance) {
      sortedCrypts = crypts
          .where(
              (element) => element.isFavorite == true && element.amount != 0.0)
          .toList();
    } else {
      sortedCrypts = crypts;
    }
  }

  @override
  void initState() {
    crypts = authService.getCrypts()!;
    sortedCrypts = crypts;
    selectedCrypt = crypts[0];
    selectedWallet = selectedCrypt;
    swapCrypts = authService.getCryptsByCryptsName(selectedCrypt!.swapCrypts);
    selectedCryptBuy = swapCrypts[0];
    currencies = authService.getCurrencies();
    selectedCurrency = currencies[0];
    super.initState();
  }
}
