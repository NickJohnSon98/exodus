import 'package:exodus/features/txApp/core/constants/color.dart';
import 'package:exodus/features/txApp/core/constants/image.dart';
import 'package:exodus/features/txApp/core/constants/text.dart';
import 'package:exodus/features/txApp/core/extensions/widget_extensions.dart';
import 'package:exodus/features/txApp/data/repositories/hive_repo.dart';
import 'package:exodus/features/txApp/feature/home/home_page.dart';
import 'package:exodus/features/txApp/feature/onboarding/components/widget_onboarding.dart';
import 'package:exodus/features/txApp/feature/onboarding/state_managment/cubit.dart';
import 'package:exodus/features/txApp/feature/onboarding/state_managment/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/app_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final cubit = OnboardingCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: BlocBuilder<OnboardingCubit, OnboardingState>(
          bloc: cubit,
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                state.index == 0
                    ? Expanded(
                        child: Column(
                          children: [
                            const OnboardingWidget(
                              welcomeText: AppTexts.welcomeCryptoSpace,
                              numberOnboarding: AppTexts.onethree,
                              futureText: AppTexts.futureFinance,
                              image: AppImages.onboarding1,
                            ),
                            const Spacer(),
                            AppButton(
                              text: AppTexts.next,
                              onTap: () {
                                cubit.index();
                              },
                            ).paddingOnly(l: 24, r: 24, b: 20)
                          ],
                        ),
                      )
                    : state.index == 1
                        ? Expanded(
                            child: Column(
                              children: [
                                const OnboardingWidget(
                                  welcomeText: AppTexts.startYourCrypto,
                                  numberOnboarding: AppTexts.twothree,
                                  futureText: AppTexts.stepbystep,
                                  image: AppImages.onboardingTwo,
                                ),
                                const Spacer(),
                                AppButton(
                                  text: AppTexts.next,
                                  onTap: () {
                                    cubit.index();
                                  },
                                ).paddingOnly(l: 24, r: 24, b: 20)
                              ],
                            ),
                          )
                        : Expanded(
                            child: Column(
                              children: [
                                const OnboardingWidget(
                                  welcomeText: AppTexts.joinCrypto,
                                  numberOnboarding: AppTexts.threethree,
                                  futureText: AppTexts.blockchainTech,
                                  image: AppImages.onboardingThree,
                                ),
                                const Spacer(),
                                AppButton(
                                  text: AppTexts.goToHome,
                                  onTap: () {
                                    HiveRepo().setIsNotFirstOpen();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const HomePage(),
                                      ),
                                    );
                                  },
                                ).paddingOnly(l: 24, r: 24, b: 20)
                              ],
                            ),
                          )
              ],
            );
          },
        ),
      ),
    );
  }
}
