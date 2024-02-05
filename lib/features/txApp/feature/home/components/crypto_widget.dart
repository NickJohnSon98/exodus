// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:exodus/features/txApp/core/constants/color.dart';
import 'package:exodus/features/txApp/core/constants/image.dart';
import 'package:exodus/features/txApp/core/extensions/widget_extensions.dart';
import 'package:exodus/features/txApp/data/models/crypto_data_model.dart';

class CryptoWidget extends StatelessWidget {
  const CryptoWidget({
    Key? key,
    required this.crypto,
    required this.onTap,
    required this.onStarTap,
    required this.isFavorite,
  }) : super(key: key);
  final CryptoDataModel crypto;
  final VoidCallback onTap;
  final VoidCallback onStarTap;
  final bool isFavorite;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: [
            GestureDetector(
              onTap: onStarTap,
              child: Image.asset(
                isFavorite ? AppImages.activeStar : AppImages.unActiveStar,
                height: 25,
                width: 25,
              ),
            ).paddingSymetric(h: 11),
            Image.network(
              crypto.icon,
              width: 45,
              height: 45,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  crypto.name,
                  style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.white,
                      fontWeight: FontWeight.w700),
                ).paddingOnly(l: 17),
                Text(
                  crypto.symbol,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.darkBlue),
                ).paddingOnly(l: 17, t: 3)
              ],
            ),
            const Spacer(),
            Text(
              "\$${crypto.currentPrice}",
              style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.white,
                  fontWeight: FontWeight.w700),
            ).paddingOnly(r: 11),
          ],
        ),
      ),
    );
  }
}
