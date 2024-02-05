import 'package:exodus/features/txApp/core/constants/color.dart';
import 'package:exodus/features/txApp/core/constants/image.dart';
import 'package:exodus/features/txApp/core/constants/text.dart';
import 'package:exodus/features/txApp/core/extensions/widget_extensions.dart';
import 'package:exodus/features/txApp/feature/home/components/crypto_builder/crypto_builder.dart';
import 'package:exodus/features/txApp/feature/home/state_managment/cubit.dart';
import 'package:exodus/features/txApp/feature/home/state_managment/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllCryptoScreen extends StatefulWidget {
  const AllCryptoScreen({super.key});

  @override
  State<AllCryptoScreen> createState() => _AllCryptoScreenState();
}

class _AllCryptoScreenState extends State<AllCryptoScreen> {
  late final HomeCubit cubit;
  @override
  void initState() {
    cubit = context.read();
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
                  ).paddingOnly(l: 20),
                ),
                const Text(
                  AppTexts.all,
                  style: TextStyle(
                      fontSize: 20,
                      color: AppColors.white,
                      fontWeight: FontWeight.w700),
                ).paddingOnly(l: 15)
              ],
            ).paddingSymetric(v: 20),
            BlocBuilder<HomeCubit, HomeState>(
              bloc: cubit,
              builder: (context, state) {
                return CryptoBuilder(data: state.cryptoData);
              },
            ),
          ],
        ),
      ),
    );
  }
}
