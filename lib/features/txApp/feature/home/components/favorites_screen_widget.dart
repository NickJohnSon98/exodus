import 'package:exodus/features/txApp/core/extensions/widget_extensions.dart';
import 'package:exodus/features/txApp/feature/home/components/crypto_builder/crypto_builder.dart';
import 'package:exodus/features/txApp/feature/home/state_managment/cubit.dart';
import 'package:exodus/features/txApp/feature/home/state_managment/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/color.dart';
import '../../../core/constants/text.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  late final HomeCubit cubit;
  @override
  void initState() {
    cubit = context.read();
    cubit.getFavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          AppTexts.favorites,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
        ).paddingOnly(t: 20, b: 20, l: 20),
        BlocBuilder<HomeCubit, HomeState>(
          bloc: cubit,
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return CryptoBuilder(data: state.favorites);
          },
        )
      ],
    );
  }
}
