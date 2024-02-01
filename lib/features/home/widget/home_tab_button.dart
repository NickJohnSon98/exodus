import 'package:exodus/app_data/app_data.dart';
import 'package:flutter/material.dart';

class HomeTabButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;
  final String message;
  final bool isBuyType;
  const HomeTabButton({
    super.key,
    required this.child,
    required this.onTap,
    required this.message,
    this.isBuyType = false,
  });

  @override
  State<HomeTabButton> createState() => _HomeTabButtonState();
}

class _HomeTabButtonState extends State<HomeTabButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHover = false;
        });
      },
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          widget.onTap();
        },
        child: Tooltip(
          message: widget.message,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          textStyle: TextStyle(
            color: AppData.colors.mainGrayColor,
            fontSize: 12,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppData.colors.homeBgColor,
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            height: isHover ? 54 : 50,
            width: isHover ? 54 : 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: widget.isBuyType && isHover == true
                    ? AppData.colors.homeTabIsBuyType
                    : AppData.colors.homeTabGradient,
              ),
            ),
            padding: const EdgeInsets.all(10),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
