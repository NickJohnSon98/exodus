import 'package:exodus/app_data/app_data.dart';
import 'package:exodus/features/crypt/domain/crypt.dart';
import 'package:exodus/features/currency/domain/custom_currency.dart';
import 'package:exodus/features/home/widget/card.dart';
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
        return SizedBox(
          width: 120,
          child: Row(
            children: AppData.assets.svg.exodus,
          ),
        );
      case 1:
      case 2:
        return SizedBox(
          width: 120,
          child: Row(
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
          ),
        );
      case 3:
        return SizedBox(
          height: 55,
          child: Row(
            children: [
              const SizedBox(width: 15),
              Container(
                height: 20,
                width: 1,
                color: AppData.colors.homeSeparate,
              ),
              const SizedBox(width: 15),
              HomeTabButton(
                onTap: () => onTapTab(3),
                message: "Buy",
                isBuyType: true,
                child: AppData.assets.svg.buyTab,
              ),
            ],
          ),
        );
      default:
        return Row(
          children: AppData.assets.svg.exodus,
        );
    }
  }

  Widget get centerButtons {
    switch (selectedTabIndex) {
      case 3:
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => onBuyTapTab(0),
                child: Column(
                  children: [
                    Text(
                      "Buy Crypto",
                      style: TextStyle(
                        color: selectedBuyScreen == 0 ? Colors.white : null,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Container(
                      height: 1,
                      width: 40,
                      color: selectedBuyScreen == 0
                          ? Colors.blue
                          : Colors.transparent,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 40),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => onBuyTapTab(1),
                child: Column(
                  children: [
                    Text(
                      "History",
                      style: TextStyle(
                        color: selectedBuyScreen == 1 ? Colors.white : null,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Container(
                      height: 1,
                      width: 40,
                      color: selectedBuyScreen == 1
                          ? Colors.blue
                          : Colors.transparent,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      case 0:
      case 1:
      case 2:
      default:
        return Column(
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
            width: 170,
            padding: EdgeInsets.only(
                top: selectedTabIndex == 3 ? 20 : 32,
                bottom: selectedTabIndex == 3 ? 15 : 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => onTapTab(0),
                    child: Tooltip(
                      message: "Home",
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      textStyle: TextStyle(
                        color: AppData.colors.mainGrayColor,
                        fontSize: 12,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppData.colors.homeBgColor,
                      ),
                      child: AppData.assets.image.crypto(
                        value: "exodus",
                        width: 33,
                        height: 34,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                titleTab,
              ],
            ),
          ),
          centerButtons,
          Container(
            width: 170,
            padding: const EdgeInsets.only(top: 33, bottom: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
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

  Widget get homeBody {
    return Column(
      children: [
        const Text(
          "Start your Jorney",
          style: TextStyle(
            color: Colors.white,
            fontSize: 42,
          ),
        ),
        const SizedBox(height: 40),
        SizedBox(
          height: 250,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HomeCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppData.assets.svg.import,
                    const SizedBox(height: 15),
                    const Text(
                      "Already Have a Wallet?",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Enter your 12-word secret recovery phrase to restore an existing wallet",
                      style: TextStyle(
                        color: AppData.colors.appText,
                        fontSize: 12,
                      ),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 25),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: AppData.colors.cardButtonText,
                      ),
                      onPressed: () {},
                      child: const Text("Import Wallet"),
                    ),
                  ],
                ),
                onTap: () {},
              ),
              const SizedBox(width: 20),
              HomeCard(
                child: const Icon(
                  Icons.add,
                  size: 100,
                  color: Colors.white,
                ),
                onTap: () {},
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget get body {
    switch (selectedTabIndex) {
      case 3:
        return Container(
          padding: const EdgeInsets.only(
            top: 100,
            bottom: 400,
          ),
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF20213D),
                Color(0xFF25274A),
                Color(0xFF2D3260),
                Color(0xFF6073E9),
              ],
              stops: [0.22, 0.24, 0.46, 1.0],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 450,
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 30),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                  color: Colors.black.withOpacity(0.15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("You pay"),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          children: [
                            Positioned(
                              child: Container(
                                margin: const EdgeInsets.only(top: 5, left: 10),
                                height: 30,
                                padding:
                                    const EdgeInsets.only(left: 50, right: 9),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: AppData.colors.borderColor,
                                    width: 1.0,
                                  ),
                                ),
                                child: DropdownButton<CustomCurrency>(
                                  style: const TextStyle(),
                                  padding: EdgeInsets.zero,
                                  underline: Container(),
                                  value: selectedCurrency,
                                  items: currencies.map((CustomCurrency item) {
                                    return DropdownMenuItem<CustomCurrency>(
                                      value: item,
                                      child: Text(item.name),
                                    );
                                  }).toList(),
                                  onChanged: (CustomCurrency? newValue) {
                                    setState(() {
                                      selectedCurrency = newValue;
                                    });
                                    print('Selected: $selectedCurrency');
                                  },
                                ),
                              ),
                            ),
                            const CircleAvatar(
                              maxRadius: 20,
                              minRadius: 20,
                            )
                          ],
                        ),
                        Text(
                          money.toString(),
                          style: const TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 450,
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 30),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                  ),
                  color: Colors.black.withOpacity(0.3),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("You receive"),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          children: [
                            Positioned(
                              child: Container(
                                margin: const EdgeInsets.only(top: 5, left: 10),
                                height: 30,
                                padding:
                                    const EdgeInsets.only(left: 50, right: 9),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: AppData.colors.borderColor,
                                    width: 1.0,
                                  ),
                                ),
                                child: DropdownButton<Crypt>(
                                  style: const TextStyle(),
                                  padding: EdgeInsets.zero,
                                  underline: Container(),
                                  value: selectedCrypt,
                                  items: crypts.map((Crypt item) {
                                    return DropdownMenuItem<Crypt>(
                                      value: item,
                                      child: Text(item.name),
                                    );
                                  }).toList(),
                                  onChanged: (Crypt? newValue) {
                                    setState(() {
                                      selectedCrypt = newValue;
                                    });
                                    print('Selected: $newValue');
                                  },
                                ),
                              ),
                            ),
                            Positioned(
                              child: AppData.assets.image.crypto(
                                value: selectedCrypt?.iconName,
                                height: 40,
                                width: 40,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          money.toString(),
                          style: const TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                alignment: Alignment.center,
                width: 380,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                  ),
                  color: Colors.black.withOpacity(0.15),
                ),
                child: const Text("1 BTC ≈ \$42,975.33 USD (Includes fee)"),
              ),
              const SizedBox(height: 12),
              const SizedBox(
                width: 450,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Debit Card",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(" with "),
                    Text(
                      "Ramp",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(6),
                width: 450,
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() {
                          money = 100;
                        }),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            gradient: money == 100
                                ? const LinearGradient(
                                    colors: [
                                      Color(0xFF9f69b5),
                                      Color(0xFF460fe4),
                                    ],
                                  )
                                : null,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Text(
                            "\$100",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() {
                          money = 500;
                        }),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            gradient: money == 500
                                ? const LinearGradient(
                                    colors: [
                                      Color(0xFF9f69b5),
                                      Color(0xFF460fe4),
                                    ],
                                  )
                                : null,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Text(
                            "\$500",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() {
                          money = 10000;
                        }),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            gradient: money == 10000
                                ? const LinearGradient(
                                    colors: [
                                      Color(0xFF9f69b5),
                                      Color(0xFF460fe4),
                                    ],
                                  )
                                : null,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Text(
                            "MAX",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Container(
                width: 450,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF9f69b5),
                      Color(0xFF460fe4),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(60),
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    disabledBackgroundColor: Colors.transparent,
                  ),
                  child: const Text(
                    "CONTINUE",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      case 0:
      case 1:
      case 2:
      default:
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
            color: AppData.colors.appBg,
          ),
          child: homeBody,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppData.colors.homeBgColor,
      body: Column(
        children: [
          appBar,
          Expanded(
            child: SingleChildScrollView(
              child: body,
            ),
          ),
        ],
      ),
    );
  }
}
