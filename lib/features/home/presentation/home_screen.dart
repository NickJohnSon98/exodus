import 'package:exodus/app_data/app_data.dart';
import 'package:exodus/features/home/widget/home_tab_button.dart';
import 'package:flutter/material.dart';

import 'home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends HomeBloc {
  Widget get titleTab {
    switch (selectedTabIndex) {
      case 0:
        return Row(
          children: AppData.assets.svg.exodus,
        );
      case 1:
      case 2:
        return Row(
          children: [
            Text(
              mainCurrency,
              style: TextStyle(
                color: AppData.colors.mainGrayColor,
                fontSize: 24,
              ),
            ),
            Text(
              wallet,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        );
      case 3:
      default:
        return Row(
          children: AppData.assets.svg.exodus,
        );
    }
  }

  Widget get appBar {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      color: AppData.colors.homeBgColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 32, bottom: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppData.assets.image.crypto(
                  value: "exodus",
                  width: 33,
                  height: 34,
                ),
                const SizedBox(width: 10),
                titleTab,
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 55,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          HomeTabButton(
                            onTap: () => onTapTab(0),
                            message: "Portfolio",
                            child: AppData.assets.svg.portfolioTab,
                          ),
                          HomeTabButton(
                            onTap: () => onTapTab(1),
                            message: "Wallet",
                            child: AppData.assets.svg.walletTab,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Container(
                      height: 20,
                      width: 1,
                      color: AppData.colors.homeSeparate,
                    ),
                    const SizedBox(width: 15),
                    SizedBox(
                      width: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          HomeTabButton(
                            onTap: () => onTapTab(2),
                            message: "Swap",
                            isBuyType: true,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: AppData.assets.svg.swapTab,
                            ),
                          ),
                          HomeTabButton(
                            onTap: () => onTapTab(3),
                            message: "Buy",
                            isBuyType: true,
                            child: AppData.assets.svg.buyTab,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 2,
                          width: 40,
                          color: selectedTabIndex == 0
                              ? Colors.blue
                              : Colors.transparent,
                        ),
                        Container(
                          height: 2,
                          width: 40,
                          color: selectedTabIndex == 1
                              ? Colors.blue
                              : Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  const SizedBox(width: 31),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 2,
                          width: 40,
                          color: selectedTabIndex == 2
                              ? Colors.blue
                              : Colors.transparent,
                        ),
                        const SizedBox(width: 10),
                        Container(
                          height: 2,
                          width: 40,
                          color: selectedTabIndex == 3
                              ? Colors.blue
                              : Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 33, bottom: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.history,
                  color: AppData.colors.actionsTabs,
                  size: 30,
                ),
                const SizedBox(width: 16),
                Icon(
                  Icons.settings_outlined,
                  color: AppData.colors.actionsTabs,
                  size: 30,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          appBar,
        ],
      ),
    );
  }
}
