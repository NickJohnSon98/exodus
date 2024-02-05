import 'package:exodus/features/auth/domain/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:exodus/app_data/app_data.dart';
import 'package:exodus/features/settings/domain/settings_service.dart';

import 'init.dart';

abstract class InitBloc extends State<InitPage> {
  final SettingsService _settingsService = SettingsService();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      syncData();
    });
  }

  Future<void> syncData() async {
    relocate();
  }

  Future<void> relocate() async {
    if (mounted) {
      if (_settingsService.getMnemonicSentence() == null) {
        context.push(AppData.routes.welcomeScreen);
      } else {
        // final result = await context.push<bool?>(AppData.routes.setCode);
        // if (result == true && mounted) {
        //   context.go(AppData.routes.homeScreen);
        // }
        setState(() {
          AppData.utils.importData(
              public: _settingsService.getMnemonicSentence()!, isNew: false);
        });
        if (mounted) {
          context.go(AppData.routes.homeScreen);
        }
      }
    }
  }
}
