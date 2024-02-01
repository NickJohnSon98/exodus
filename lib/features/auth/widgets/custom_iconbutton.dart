import 'package:exodus/app_data/app_data.dart';
import 'package:flutter/material.dart';

class AuthIconButton extends StatefulWidget {
  final Widget icon;
  final String text;
  final VoidCallback onPress;
  const AuthIconButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPress,
  });

  @override
  State<AuthIconButton> createState() => _AuthIconButtonState();
}

class _AuthIconButtonState extends State<AuthIconButton> {
  bool isHover = false;

  @override
  void initState() {
    super.initState();
  }

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
        onTap: widget.onPress,
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: isHover
                    ? Colors.white.withOpacity(0.05)
                    : Colors.white.withOpacity(0.01),
              ),
              child: widget.icon,
            ),
            const SizedBox(height: 16),
            Text(
              widget.text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: isHover
                    ? AppData.colors.mainGrayColor
                    : AppData.colors.mainGrayColor.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
