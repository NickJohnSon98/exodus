import 'package:exodus/features/txApp/core/extensions/widget_extensions.dart';
import 'package:exodus/features/txApp/feature/home/all_crypto/all_crypto_screen.dart';
import 'package:exodus/features/txApp/feature/home/components/crypto_builder/crypto_builder.dart';
import 'package:exodus/features/txApp/feature/home/state_managment/cubit.dart';
import 'package:exodus/features/txApp/feature/home/state_managment/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/color.dart';
import '../../../core/constants/text.dart';

class TopTen extends StatefulWidget {
  const TopTen({super.key});

  @override
  State<TopTen> createState() => _TopTenState();
}

class _TopTenState extends State<TopTen> {
  late final HomeCubit cubit;
  @override
  void initState() {
    cubit = context.read();
    cubit.getFavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: cubit,
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  AppTexts.topTen,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ).paddingOnly(l: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider.value(
                            value: cubit, child: const AllCryptoScreen()),
                      ),
                    );
                  },
                  child: const Text(
                    AppTexts.seeAll,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
                  ).paddingOnly(r: 18),
                ),
              ],
            ).paddingSymetric(v: 20),
            CryptoBuilder(data: state.top10),
          ],
        );
      },
    );
  }
}
