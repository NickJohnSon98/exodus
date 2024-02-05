import 'package:exodus/app_data/app_data.dart';
import 'package:exodus/features/crypt/domain/crypt.dart';
import 'package:exodus/features/currency/domain/custom_currency.dart';
import 'package:exodus/features/home/widget/card.dart';
import 'package:exodus/features/home/widget/home_tab_button.dart';
import 'package:exodus/features/home/widget/line_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
      case 5:
        return SizedBox(
          height: 20,
          child: Row(
            children: [
              const SizedBox(width: 15),
              Container(
                height: 20,
                width: 1,
                color: AppData.colors.homeSeparate,
              ),
              const SizedBox(width: 15),
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
      case 5:
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => onSettingsTapTab(0),
                child: Column(
                  children: [
                    Text(
                      "Wallet",
                      style: TextStyle(
                        color:
                            selectedSettingsScreen == 0 ? Colors.white : null,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Container(
                      height: 1,
                      width: 40,
                      color: selectedSettingsScreen == 0
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
                onTap: () => onSettingsTapTab(1),
                child: Column(
                  children: [
                    Text(
                      "Backup",
                      style: TextStyle(
                        color:
                            selectedSettingsScreen == 1 ? Colors.white : null,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Container(
                      height: 1,
                      width: 40,
                      color: selectedSettingsScreen == 1
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
                onTap: () => onSettingsTapTab(2),
                child: Column(
                  children: [
                    Text(
                      "Personalize",
                      style: TextStyle(
                        color:
                            selectedSettingsScreen == 2 ? Colors.white : null,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Container(
                      height: 1,
                      width: 40,
                      color: selectedSettingsScreen == 2
                          ? Colors.blue
                          : Colors.transparent,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
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
                GestureDetector(
                  onTap: () => onTapTab(4),
                  child: Icon(
                    Icons.history,
                    color: selectedTabIndex == 4
                        ? Colors.white
                        : AppData.colors.actionsTabs,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () => onTapTab(5),
                  child: Icon(
                    Icons.settings_outlined,
                    color: selectedTabIndex == 5
                        ? Colors.white
                        : AppData.colors.actionsTabs,
                    size: 30,
                  ),
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
        ),
        const SizedBox(height: 60),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          color: AppData.colors.homeBgColor,
          child: Row(
            children: [
              const Expanded(
                child: Row(
                  children: [
                    Text("OVERVIEW"),
                    SizedBox(width: 40),
                    Text("PRICE ACTION"),
                    SizedBox(width: 40),
                    Text("PORTFOLIO"),
                    SizedBox(width: 40),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: isWithBalance,
                          onChanged: (value) => setState(() {
                            checkTable(value!, isFavorite);
                            isWithBalance = value;
                          }),
                        ),
                        const Text("With Balance"),
                      ],
                    ),
                    const SizedBox(width: 40),
                    Row(
                      children: [
                        Checkbox(
                          value: isFavorite,
                          onChanged: (value) => setState(() {
                            checkTable(isWithBalance, value!);
                            isFavorite = value;
                          }),
                        ),
                        const Text("Favorite"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 1),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          color: AppData.colors.homeBgColor,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 150,
                child: Text("ASSETS NAME"),
              ),
              SizedBox(
                width: 150,
                child: Text("PRICE"),
              ),
              SizedBox(
                width: 150,
                child: Text("24H CHANGE"),
              ),
              SizedBox(
                width: 150,
                child: Text("24H VOL"),
              ),
              SizedBox(
                width: 275,
                child: Text("30 DAY TREND"),
              ),
            ],
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 150,
                        child: Row(
                          children: [
                            AppData.assets.image.crypto(
                              value: sortedCrypts[index].iconName,
                              height: 30,
                              width: 30,
                            ),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  sortedCrypts[index].name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(sortedCrypts[index].shortName),
                              ],
                            ),
                          ],
                        )),
                    SizedBox(
                      width: 150,
                      child: Text(
                          "\$${AppData.utils.doubleToSixValues(sortedCrypts[index].priceForOne)}"),
                    ),
                    SizedBox(
                      width: 150,
                      child: Text(
                          "\$${sortedCrypts[index].changesCrypt.percentId}"),
                    ),
                    SizedBox(
                      width: 150,
                      child: Text(
                          "\$${sortedCrypts[index].changesCrypt.absoluteId}"),
                    ),
                    SizedBox(
                      width: 275,
                      child: sortedCrypts[index].diagramModel!.points == null ||
                              sortedCrypts[index].diagramModel!.max == null
                          ? null
                          : LineWidget(
                              points: sortedCrypts[index]
                                  .diagramModel!
                                  .points!
                                  .map((e) => e[1])
                                  .toList(),
                            ),
                    ),
                  ],
                ),
                // const SfCartesianChart(),
              ],
            ),
          ),
          separatorBuilder: (context, index) => Container(
            height: 1,
            width: double.infinity,
            color: AppData.colors.homeCardBg,
          ),
          itemCount: sortedCrypts.length,
        ),
      ],
    );
  }

  Widget settingsMenu({
    required Widget icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 32),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppData.colors.homeCardBg,
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                  colors: AppData.colors.homeTabIsBuyType,
                ),
              ),
              child: icon,
            ),
            const SizedBox(width: 32),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get body {
    switch (selectedTabIndex) {
      case 5:
        return Container(
          width: double.infinity,
          color: AppData.colors.appBg,
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 60),
          child: Column(
            children: [
              const Text(
                "Wallet",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 40),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppData.colors.homeCardBg,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 133, vertical: 16),
                child: Column(
                  children: [
                    Text(
                      authService.getAddress()!,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "\$ ${authService.getWallet()}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 42,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 80),
              settingsMenu(
                onTap: () => showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Text(settingsService.getMnemonicSentence()!),
                    actions: [
                      IconButton(
                        onPressed: () {
                          context.pop();
                        },
                        icon: const Icon(Icons.copy),
                      ),
                    ],
                  ),
                ),
                icon: const Icon(
                  Icons.description,
                  color: Colors.white,
                ),
                text: "View Recovery Phrase",
              ),
              const SizedBox(height: 24),
              settingsMenu(
                onTap: () => showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Text(settingsService.getPrivateKey()!),
                    actions: [
                      IconButton(
                        onPressed: () {
                          context.pop();
                        },
                        icon: const Icon(Icons.copy),
                      ),
                    ],
                  ),
                ),
                icon: const Icon(
                  Icons.key,
                  color: Colors.white,
                ),
                text: "View Private Key",
              ),
              const SizedBox(height: 24),
              settingsMenu(
                onTap: () => showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: const Text(" You really want delete wallet ?"),
                    actions: [
                      IconButton(
                        onPressed: () {
                          context.pop();
                        },
                        icon: const Icon(Icons.check),
                      ),
                      IconButton(
                        onPressed: () {
                          context.pop();
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                ),
                icon: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
                text: "Delete wallet",
              ),
              const SizedBox(height: 160),
            ],
          ),
        );
      case 4:
        return Container(
          color: AppData.colors.appBg,
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "History",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    height: 30,
                    padding: const EdgeInsets.only(left: 50, right: 9),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: AppData.colors.borderColor,
                        width: 1.0,
                      ),
                      color: AppData.colors.homeBgColor,
                    ),
                    child: DropdownButton<String>(
                      style: const TextStyle(),
                      padding: EdgeInsets.zero,
                      underline: Container(),
                      value: selectedHistoryType,
                      items: historyType.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedHistoryType = newValue!;
                        });
                        print('Selected: $selectedHistoryType');
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    height: 30,
                    padding: const EdgeInsets.only(left: 50, right: 9),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: AppData.colors.borderColor,
                        width: 1.0,
                      ),
                      color: AppData.colors.homeBgColor,
                    ),
                    child: DropdownButton<String>(
                      style: const TextStyle(),
                      padding: EdgeInsets.zero,
                      underline: Container(),
                      value: selectedHistoryAssets,
                      items: historyAssets.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedHistoryAssets = newValue!;
                        });
                        print('Selected: $selectedHistoryAssets');
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 50),
                decoration: BoxDecoration(
                  color: AppData.colors.homeCardBg,
                ),
                child: const Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("TYPE"),
                          Text("PAIR"),
                          Text("NOTE"),
                        ],
                      ),
                    ),
                    SizedBox(width: 250),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("STATUS"),
                          Text("AMOUNT"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 80, bottom: 500),
                child: Center(
                  child: Text(
                    "No Transactions",
                    style: TextStyle(
                      fontSize: 22,
                      color: AppData.colors.textColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      case 3:
        return Container(
          padding: const EdgeInsets.only(
            top: 50,
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
          child: selectedBuyScreen == 0
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 450,
                      padding: const EdgeInsets.symmetric(
                          vertical: 24, horizontal: 30),
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
                                      margin: const EdgeInsets.only(
                                          top: 5, left: 10),
                                      height: 30,
                                      padding: const EdgeInsets.only(
                                          left: 50, right: 9),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
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
                                        items: currencies
                                            .map((CustomCurrency item) {
                                          return DropdownMenuItem<
                                              CustomCurrency>(
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 24, horizontal: 30),
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
                                      margin: const EdgeInsets.only(
                                          top: 5, left: 10),
                                      height: 30,
                                      padding: const EdgeInsets.only(
                                          left: 50, right: 9),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
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
                      child:
                          const Text("1 BTC ≈ \$42,975.33 USD (Includes fee)"),
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
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
                )
              : const Padding(
                  padding: EdgeInsets.symmetric(vertical: 100),
                  child: Center(
                    child: Text(
                      "No transactions",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                      ),
                    ),
                  ),
                ),
        );
      case 2:
        return Container(
          padding: const EdgeInsets.only(
            top: 50,
            bottom: 800,
          ),
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF1F2428),
                Color(0xFF1B1D1E),
              ],
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
                    Text(
                        "I have ${selectedCrypt?.amount} ${selectedCrypt?.name}"),
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
                                      swapCrypts =
                                          authService.getCryptsByCryptsName(
                                        selectedCrypt!.swapCrypts,
                                      );
                                      selectedCryptBuy = swapCrypts[0];
                                      swapMoney =
                                          selectedCrypt!.amountInCurrency;
                                      swapAmount = swapMoney /
                                          selectedCryptBuy!.priceForOne;
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              swapAmount.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              "\$ $swapMoney",
                            ),
                          ],
                        ),
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
                    Text("I want  ${selectedCryptBuy?.name}"),
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
                                  value: selectedCryptBuy,
                                  items: swapCrypts.map((Crypt item) {
                                    return DropdownMenuItem<Crypt>(
                                      value: item,
                                      child: Text(item.name),
                                    );
                                  }).toList(),
                                  onChanged: (Crypt? newValue) {
                                    setState(() {
                                      selectedCryptBuy = newValue;
                                      swapAmount = swapMoney /
                                          selectedCryptBuy!.priceForOne;
                                    });
                                    print('Selected: $newValue');
                                  },
                                ),
                              ),
                            ),
                            Positioned(
                              child: AppData.assets.image.crypto(
                                value: selectedCryptBuy?.iconName,
                                height: 40,
                                width: 40,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              buyMoney.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              "\$ $swapMoney",
                            ),
                          ],
                        ),
                      ],
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
                          buyAmount = 0.0;
                        }),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Text(
                            "MIN",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() {
                          buyAmount = selectedCrypt!.amount / 2;
                        }),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Text(
                            "HALF",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() {
                          buyAmount = selectedCryptBuy!.amount;
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
                    "ENTER AMOUNT",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      case 1:
        return Column(
          children: [
            Scrollbar(
              controller: scrollController,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0),
                  ),
                  color: AppData.colors.homeCardHoverBg,
                ),
                width: double.infinity,
                height: 70,
                child: ListView.separated(
                  controller: scrollController,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => setState(() {
                        selectedWallet = crypts[index];
                      }),
                      child: Container(
                        width: 140,
                        padding: const EdgeInsets.only(top: 16),
                        child: Column(
                          children: [
                            Text(crypts[index].name),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(crypts[index].amount.toString()),
                                const SizedBox(width: 5),
                                Text(crypts[index].shortName),
                              ],
                            ),
                            const Expanded(
                              child: SizedBox(),
                            ),
                            selectedWallet == crypts[index]
                                ? Container(
                                    width: 140,
                                    height: 1,
                                    color: Colors.blue,
                                  )
                                : Container()
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                      width: 2,
                      height: 40,
                      color: AppData.colors.homeSeparate,
                    );
                  },
                  itemCount: crypts.length,
                ),
              ),
            ),
            Container(
              color: AppData.colors.appBg,
              width: double.infinity,
              padding: const EdgeInsets.only(top: 50, left: 40, right: 40),
              child: Column(
                children: [
                  AppData.assets.image.crypto(
                    value: selectedWallet?.iconName,
                    height: 67,
                    width: 67,
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 120,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          selectedWallet!.amount.toString(),
                          style: const TextStyle(
                            fontSize: 98,
                          ),
                          textAlign: TextAlign.end,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          selectedWallet!.shortName,
                          style: const TextStyle(
                            fontSize: 42,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        selectedCurrency!.symbol,
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        selectedCrypt!.amountInCurrency.toString(),
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 80, vertical: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                              width: 1,
                              color: AppData.colors.borderColor,
                            ),
                          ),
                          child: const Text("Send"),
                        ),
                      ),
                      const SizedBox(width: 24),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 80, vertical: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                              width: 1,
                              color: AppData.colors.borderColor,
                            ),
                          ),
                          child: const Text("Receive"),
                        ),
                      ),
                      const SizedBox(width: 24),
                      GestureDetector(
                        onTap: () {},
                        child: const CircleAvatar(
                          radius: 20,
                          child: Icon(Icons.swap_horiz),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 14),
                          child: Text(
                            "PRICE CHAT",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Container(
                          width: double.infinity,
                          height: 1,
                          color: AppData.colors.homeCardBg,
                        ),
                        const SizedBox(height: 24),
                        const Padding(
                          padding: EdgeInsets.only(left: 14),
                          child: Row(
                            children: [
                              Text(
                                "ACTIVITY",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(width: 40),
                              Text(
                                "ABOUT",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 18),
                        Container(
                          width: double.infinity,
                          height: 1,
                          color: AppData.colors.homeCardBg,
                        ),
                        const SizedBox(height: 90),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            "No ${selectedWallet!.name} Trancasactions",
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 400),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      case 0:
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
