import 'package:exodus/features/txApp/core/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/color.dart';

class OnboardingWidget extends StatefulWidget {
  const OnboardingWidget({
    super.key,
    required this.welcomeText,
    required this.numberOnboarding,
    required this.futureText,
    required this.image,
  });
  final String welcomeText;
  final String numberOnboarding;
  final String futureText;
  final String image;
  @override
  State<OnboardingWidget> createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.welcomeText,
              style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                  height: 1.5),
            ).paddingOnly(l: 24),
            Text(
              widget.numberOnboarding,
              style: const TextStyle(
                  fontSize: 32,
                  color: AppColors.buttonColor,
                  fontWeight: FontWeight.w600),
            ).paddingOnly(r: 15, t: 5),
          ],
        ),
        Text(
          widget.futureText,
          style: const TextStyle(
              fontSize: 13,
              color: AppColors.white,
              fontWeight: FontWeight.w500),
        ).paddingOnly(t: 12, l: 25),
        Center(
            child: Image.asset(
          widget.image,
          width: 325,
          height: 364,
        ).paddingOnly(t: 78)),
      ],
    );
  }
}
