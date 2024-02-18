import 'dart:async';

import 'package:exodus/app_data/app_data.dart';
import 'package:exodus/features/settings/domain/settings.dart';
import 'package:exodus/features/settings/domain/settings_service.dart';
import 'package:flutter/material.dart';
import 'package:exodus/features/auth/presentation/welcome/welcome.dart';
import 'package:go_router/go_router.dart';

abstract class WelcomeBloc extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  // Fields
  List<TextEditingController> controllers = List.generate(
    12,
    (index) => TextEditingController(),
  );

  List<TextStyle> textStyles = List.generate(
    12,
    (index) => TextStyle(
      foreground: Paint()
        ..shader = const LinearGradient(
          colors: <Color>[
            Colors.white, Colors.white,
            //add more color here.
          ],
        ).createShader(
          const Rect.fromLTWH(0.0, 0.0, 200.0, 100.0),
        ),
    ),
  );

  bool isLoadingWallet = false;
  bool? isError;

  AnimationController? _controller;
  Animation<double>? _animation;

  double value = 0.0;

  // Methods
  void textField(int index) {
    setState(() {
      textStyles[index] = controllers[index].text.isEmpty
          ? TextStyle(
              foreground: Paint()
                ..shader = const LinearGradient(
                  colors: <Color>[
                    Colors.white, Colors.white,
                    //add more color here.
                  ],
                ).createShader(
                  const Rect.fromLTWH(0.0, 0.0, 200.0, 100.0),
                ),
            )
          : TextStyle(
              foreground: Paint()
                ..shader = const LinearGradient(
                  colors: <Color>[
                    Colors.white,
                    Colors.white,
                    //add more color here.
                  ],
                ).createShader(
                  const Rect.fromLTWH(0.0, 0.0, 200.0, 100.0),
                ),
            );
    });
  }

  bool get isFullTextFields {
    bool isEmpty = controllers.any((element) => element.text.isEmpty);
    if (isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  FutureOr<void> createWallet() async {
    setState(() {
      isLoadingWallet = true;
    });
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    _animation = Tween<double>(begin: 0.0, end: 0.95).animate(_controller!)
      ..addListener(() {
        setState(() {
          value = _animation!.value;
        });
      });
    _controller!.forward();

    String public = controllers.map((controller) => controller.text).join(" ");

    final result = await AppData.utils.importData(
      public: public,
      isNew: false,
      putPrivateKey: true,
    );
    print("result $result");
    if (result) {
      setState(() {
        isError = false;
      });
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          context.push(AppData.routes.homeScreen);
        }
      });
    } else {
      setState(() {
        isError = true;
      });
      const snackBar = SnackBar(
        content: Text('Your wallet has not been imported'),
        duration: Duration(seconds: 3),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      Future.delayed(const Duration(seconds: 5), () {
        setState(() {
          isLoadingWallet = false;
        });
      });
    }
  }
}
