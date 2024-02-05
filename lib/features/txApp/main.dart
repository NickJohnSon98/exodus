import 'package:exodus/features/txApp/data/managers/crypto_data_manager.dart';
import 'package:exodus/features/txApp/data/repositories/crypto_data_repo.dart';
import 'package:exodus/features/txApp/data/repositories/hive_repo.dart';
import 'package:exodus/features/txApp/feature/splash_screen/splash_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveRepo().init();
  try {
    await CryptoDataManager().defineData();
  } catch (e) {}
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
