import 'package:exodus/app_data/app_data.dart';
import 'package:exodus/features/auth/domain/auth_service.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

abstract class HomeBloc extends State<HomeScreen> {
  final AuthService authService = AuthService();

  int selectedTabIndex = 0;

  void onTapTab(int index) {
    setState(() {
      selectedTabIndex = index;
    });
    print(" selectedTabIndex $selectedTabIndex");
  }

  String get mainCurrency {
    return authService.getSelectCurrency()!.symbol;
  }

  String get wallet {
    return AppData.utils.doubleToTwoValues(authService.getWallet()!);
  }
}
