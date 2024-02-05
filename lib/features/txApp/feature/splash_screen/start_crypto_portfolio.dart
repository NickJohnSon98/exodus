import 'package:exodus/features/txApp/core/constants/color.dart';
import 'package:exodus/features/txApp/core/constants/image.dart';
import 'package:exodus/features/txApp/core/constants/text.dart';
import 'package:exodus/features/txApp/core/extensions/widget_extensions.dart';
import 'package:exodus/features/txApp/feature/components/app_button.dart';
import 'package:exodus/features/txApp/feature/onboarding/screen.dart';
import 'package:exodus/features/txApp/feature/onboarding/state_managment/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartCrypto extends StatefulWidget {
  const StartCrypto({super.key});

  @override
  State<StartCrypto> createState() => _StartCryptoState();
}

class _StartCryptoState extends State<StartCrypto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            const Text(
              AppTexts.crypto,
              style: TextStyle(
                fontSize: 64,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ).paddingOnly(l: 24),
            const Spacer(),
            Center(
              child: Image.asset(
                AppImages.startPortfolio,
                width: 375,
                height: 389,
              ).paddingOnly(),
            ),
            const Spacer(),
            const Text(
              AppTexts.startPortfolio,
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  height: 1.4),
            ).paddingOnly(l: 24),
            const Text(
              AppTexts.investmentPortfolio,
              style: TextStyle(
                  fontSize: 14,
                  color: AppColors.white,
                  fontWeight: FontWeight.w500),
            ).paddingAll(24),
            const Spacer(),
            AppButton(
                text: AppTexts.getStarted,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BlocProvider(
                                create: (context) => OnboardingCubit(),
                                child: const OnboardingPage(),
                              )));
                }).paddingOnly(l: 24, r: 24, b: 20)
          ],
        ),
      ),
    );
  }
}
