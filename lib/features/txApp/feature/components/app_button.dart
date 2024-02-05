import 'package:exodus/features/txApp/core/constants/color.dart';
import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  const AppButton({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;
  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.maxFinite,
        height: 52,
        decoration: BoxDecoration(
            color: AppColors.buttonColor,
            borderRadius: BorderRadius.circular(16)),
        child: Text(
          widget.text,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
