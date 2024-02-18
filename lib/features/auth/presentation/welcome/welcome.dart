import 'dart:io';

import 'package:exodus/app_data/app_data.dart';
import 'package:exodus/features/auth/widgets/custom_iconbutton.dart';
import 'package:flutter/material.dart';
import 'package:exodus/features/auth/presentation/welcome/welcome_bloc.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends WelcomeBloc {
  // Main Screen
  Widget get welcome {
    switch (isLoadingWallet) {
      case true:
        return loadingBody;
      case false:
        return body;
    }
  }

  // Body
  Widget get body {
    return Padding(
      padding:
          const EdgeInsets.only(left: 140, right: 100, top: 100, bottom: 35),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          headerBody("Type your 12-Word Phrase"),
          phrases,
          buttonsBody,
        ],
      ),
    );
  }

  Widget headerBody(String subtitle) {
    return Column(
      children: [
        Stack(
          children: [
            AppData.assets.image.crypto(
              value: 'exodus',
              height: 80,
              width: 83,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: AppData.assets.svg.access,
            ),
          ],
        ),
        const SizedBox(height: 30),
        const Text(
          "Restore Wallet",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget get phrases {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: RawKeyboardListener(
            focusNode: FocusNode(),
            onKey: (RawKeyEvent event) async {
              if (event is RawKeyDownEvent &&
                  event.logicalKey == LogicalKeyboardKey.keyV &&
                  event.isControlPressed) {
                await Future.delayed(const Duration(milliseconds: 10));
                ClipboardData? clipboardData =
                    await Clipboard.getData(Clipboard.kTextPlain);

                if (clipboardData?.text != null) {
                  String clipboardText = clipboardData!.text!;
                  List<String> words = clipboardText.split(' ');

                  for (int i = 0; i < words.length; i++) {
                    setState(() {
                      controllers[i].text = words[i];
                    });
                    textField(i);
                  }
                }
              }
            },
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 2 / 1,
              ),
              itemBuilder: (context, index) => SizedBox(
                width: 50,
                child: TextField(
                  cursorColor: Colors.white,
                  onChanged: (value) {
                    textField(index);
                  },
                  controller: controllers[index],
                  decoration: InputDecoration(
                    hintText: (index + 1).toString(),
                    hintStyle: TextStyle(color: AppData.colors.textColor),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2,
                      ),
                    ),
                  ),
                  textAlign: TextAlign.center,
                  style: textStyles[index],
                ),
              ),
              itemCount: 12,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Tooltip(
          showDuration: const Duration(milliseconds: 100),
          message: "Import Wallet",
          child: SizedBox(
            width: 40,
            child: !isFullTextFields
                ? null
                : IconButton(
                    onPressed: createWallet,
                    icon: AppData.assets.svg.arrow,
                  ),
          ),
        ),
      ],
    );
  }

  Widget get buttonsBody {
    return SizedBox(
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AuthIconButton(
                icon: AppData.assets.svg.help,
                text: "Help",
                onPress: () => showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text(
                      "Help",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    content: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                        children: [
                          const TextSpan(
                            text:
                                "You need to write your 12-words phrase to import wallet. If your wallet is not imported, it means it is either not created or you are entering incorrect data. Before you click the import wallet button, ",
                          ),
                          TextSpan(
                            text: 'double-check the entered phrase',
                            style: TextStyle(
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              backgroundColor: AppData.colors.alertDialogBg2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      IconButton(
                        onPressed: () => context.pop(),
                        icon: const Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                      ),
                      IconButton(
                        onPressed: () => context.pop(),
                        icon: Icon(
                          Icons.close,
                          color: AppData.colors.mainGrayColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AuthIconButton(
                icon: AppData.assets.svg.turn_off,
                text: "Quit",
                onPress: () => exit(0),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Loading Body
  Widget get loadingBody {
    return Padding(
      padding:
          const EdgeInsets.only(left: 140, right: 140, top: 100, bottom: 230),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          headerBody("Loading..."),
          errorText,
        ],
      ),
    );
  }

  Widget get errorText {
    switch (isError) {
      case null:
        return ProgressBar(
          height: 2,
          width: double.infinity,
          value: value,
          backgroundColor: AppData.colors.loadingGrayColor,
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: AppData.colors.loadingGradient,
          ),
        );
      case false:
        return const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 25,
            ),
            SizedBox(width: 10),
            Text("You wallet is imported"),
          ],
        );
      case true:
        return const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              color: Colors.red,
              size: 25,
            ),
            SizedBox(width: 10),
            Text("You wallet is not imported. You data is not valid!"),
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
            alignment: Alignment.topCenter,
            image: AssetImage('assets/layouts/welcome.png'),
            fit: BoxFit.fitWidth,
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppData.colors.backgroundGradient,
          ),
        ),
        child: welcome,
      ),
    );
  }
}
