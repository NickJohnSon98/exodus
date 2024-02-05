// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:exodus/features/txApp/core/extensions/widget_extensions.dart';
import 'package:exodus/features/txApp/feature/home/all_info_crypto/screen.dart';
import 'package:exodus/features/txApp/feature/home/components/crypto_builder/state.dart';
import 'package:exodus/features/txApp/feature/home/components/crypto_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:exodus/features/txApp/data/models/crypto_data_model.dart';
import 'package:exodus/features/txApp/feature/home/components/crypto_builder/cubit.dart';

class CryptoBuilder extends StatefulWidget {
  const CryptoBuilder({
    Key? key,
    required this.data,
  }) : super(key: key);
  final List<CryptoDataModel> data;
  @override
  State<CryptoBuilder> createState() => _CryptoBuilderState();
}

class _CryptoBuilderState extends State<CryptoBuilder> {
  late final CryptoBuilderCubit cubit;
  @override
  void initState() {
    cubit = CryptoBuilderCubit(widget.data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptoBuilderCubit, CryptoBuilderState>(
      bloc: cubit,
      builder: (context, state) {
        return Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: state.data.length,
            itemBuilder: (context, index) {
              final item = state.data[index];
              return CryptoWidget(
                isFavorite: state.favorites[item.id] != null,
                onStarTap: () {
                  cubit.toggleFavoriteId(item.id);
                },
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AllInfoCrypto(crypto: item),
                    ),
                  );
                },
                crypto: item,
              ).paddingOnly(b: 20);
            },
          ),
        );
      },
    );
  }
}
