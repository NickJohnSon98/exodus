// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:exodus/features/txApp/core/constants/color.dart';
import 'package:exodus/features/txApp/core/extensions/widget_extensions.dart';
import 'package:exodus/features/txApp/data/models/crypto_data_model.dart';
import 'package:exodus/features/txApp/feature/home/all_info_crypto/components/line_chart_widget.dart';

import '../../../core/constants/image.dart';

class AllInfoCrypto extends StatefulWidget {
  const AllInfoCrypto({
    Key? key,
    required this.crypto,
  }) : super(key: key);
  final CryptoDataModel crypto;
  @override
  State<AllInfoCrypto> createState() => _AllInfoCryptoState();
}

class _AllInfoCryptoState extends State<AllInfoCrypto> {
  late final double maxValue;
  late final double minValue;

  @override
  void initState() {
    final sorted = List<double>.from(widget.crypto.lastWeekPriceChanges)
      ..sort(
        (a, b) => a.compareTo(b),
      );
    maxValue = sorted.last;
    minValue = maxValue * .5;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    AppImages.arrowBack,
                    width: 36,
                    height: 10,
                  ).paddingOnly(t: 17, l: 20),
                ),
                Expanded(
                  child: FittedBox(
                    child: Row(
                      children: [
                        Text(
                          widget.crypto.name,
                          style: const TextStyle(
                              fontSize: 28,
                              color: AppColors.white,
                              fontWeight: FontWeight.w500),
                        ).paddingOnly(t: 12, l: 15),
                        Image.asset(
                          AppImages.underline,
                          width: 20,
                        ).paddingOnly(t: 17, l: 10),
                        Text(
                          widget.crypto.symbol,
                          style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w400,
                              color: AppColors.darkBlue),
                        ).paddingOnly(l: 10, t: 13),
                      ],
                    ),
                  ),
                ),
                Text(
                  "\$${widget.crypto.currentPrice}",
                  style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.white,
                      fontWeight: FontWeight.w500),
                ).paddingOnly(t: 13, l: 44),
              ],
            ),
            LineChartWidget(
                data: generateRandomDoubles(
                  widget.crypto.lastWeekPriceChanges.length ~/ 2,
                ),
                maxValue: maxValue),
          ],
        ),
      ),
    );
  }

  List<double> generateRandomDoubles(int length) {
    Random random = Random();
    List<double> randomList = List<double>.generate(
      length,
      (index) => minValue + random.nextDouble() * (maxValue - minValue),
    );
    return randomList;
  }
}
