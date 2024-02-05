import 'package:exodus/features/txApp/core/constants/color.dart';
import 'package:exodus/features/txApp/core/constants/text.dart';
import 'package:exodus/features/txApp/data/repositories/hive_repo.dart';
import 'package:exodus/features/txApp/feature/home/home_page.dart';
import 'package:exodus/features/txApp/feature/splash_screen/start_crypto_portfolio.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navigate() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              HiveRepo().isFirstOpen ? const StartCrypto() : const HomePage(),
        ),
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigate();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppTexts.crypto,
              style: TextStyle(
                fontSize: 64,
                color: AppColors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
