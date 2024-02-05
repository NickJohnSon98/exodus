import 'package:flutter/material.dart';

import '../../../app_data.dart';

class ButtonThemeCollection {
  ButtonThemeCollection();

  ButtonStyle get nextSlide => ElevatedButton.styleFrom(
        disabledBackgroundColor: Colors.grey,
        backgroundColor: Colors.purple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      );

  ButtonStyle get outlinedButton => OutlinedButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        textStyle: AppData.theme.text.s16w500.copyWith(
          color: Colors.purple,
          fontFamily: AppData.theme.text.fontFamily,
        ),
        shadowColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        side: BorderSide(
          color: Colors.purple.withOpacity(0.5),
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        alignment: Alignment.center,
      );

  ButtonStyle get defaultTextButton => TextButton.styleFrom(
        textStyle:
            AppData.theme.text.s14w500.copyWith(color: const Color(0xFF907AFF)),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      );

  ButtonStyle get defaultElevatedButton => ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        textStyle: AppData.theme.text.s14w600.copyWith(color: Colors.white),
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      );

  ButtonStyle get defaultIconButton => IconButton.styleFrom(
        elevation: 0,
        foregroundColor: AppData.colors.mainGrayColor,
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      );

  ButtonStyle get whiteElevatedButton => ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        textStyle: AppData.theme.text.s14w600,
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        side: BorderSide(
          color: AppData.colors.gray300,
        ),
      );

  ButtonStyle get greenElevatedButton => ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        textStyle: AppData.theme.text.s14w600,
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        side: BorderSide(
          color: AppData.colors.gray300,
        ),
      );
  ButtonStyle get deleteElevatedButton => ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        textStyle: AppData.theme.text.s14w600,
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        side: BorderSide(
          color: AppData.colors.gray300,
        ),
      );
  ButtonStyle get acceptElevatedButton => ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        textStyle: AppData.theme.text.s14w600,
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        side: BorderSide(
          color: AppData.colors.gray300,
        ),
      );
}
