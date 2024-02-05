import 'package:flutter/material.dart';

// import '../../features/settings/domain/settings_service.dart';

class ColorsCollection {
  // final SettingsService settingsService = SettingsService();
  // bool isLightTheme() {
  //   if (settingsService.getTheme() != null) {
  //     return settingsService.getTheme() == true;
  //   }
  //   return true;
  // }

  /// Цвет фона страниц
  Color get backgroundColor => const Color(0xffC5C5C5);
  Color get backgroundBlackColor => Colors.black;

  /// Цвет фона страниц, который чуть темнее, чем [backgroundColor]
  Color get lightBackgroundColor => gray300;

  /// Цвет текста
  // Color get textColor => isLightTheme() ? gray700 : gray100;
  Color get textColor => mainGrayColor;

  /// Цвет ошибок
  Color get red040 => const Color(0xFFD94040);

  /// Основные цвета
  /// Оттенки серого
  Color get gray100 => Colors.grey.shade100;
  Color get gray200 => Colors.grey.shade200;
  Color get gray300 => Colors.grey.shade300;
  Color get gray400 => Colors.grey.shade400;
  Color get gray500 => Colors.grey.shade500;
  Color get gray600 => Colors.grey.shade600;
  Color get gray700 => Colors.grey.shade700;
  Color get gray800 => Colors.grey.shade800;
  Color get gray900 => Colors.grey.shade900;
  Color get gray50 => Colors.grey.shade50;
  Color get gray => Colors.grey;

  /// Оттенки фиолетового
  Color get purple100 => Colors.purple.shade100;
  Color get purple200 => Colors.purple.shade200;
  Color get purple300 => Colors.purple.shade300;
  Color get purple400 => Colors.purple.shade400;
  Color get purple500 => Colors.purple.shade500;
  Color get purple600 => Colors.purple.shade600;
  Color get purple700 => Colors.purple.shade700;
  Color get purple800 => Colors.purple.shade800;
  Color get purple900 => Colors.purple.shade900;
  Color get purple50 => Colors.purple.shade50;
  Color get purple => Colors.purple;

  /// Оттенки темного фиолетового
  Color get deepPurple100 => Colors.deepPurple.shade100;
  Color get deepPurple200 => Colors.deepPurple.shade200;
  Color get deepPurple300 => Colors.deepPurple.shade300;
  Color get deepPurple400 => Colors.deepPurple.shade400;
  Color get deepPurple500 => Colors.deepPurple.shade500;
  Color get deepPurple600 => Colors.deepPurple.shade600;
  Color get deepPurple700 => Colors.deepPurple.shade700;
  Color get deepPurple800 => Colors.deepPurple.shade800;
  Color get deepPurple900 => Colors.deepPurple.shade900;
  Color get deepPurple50 => Colors.deepPurple.shade50;
  Color get deepPurple => Colors.deepPurple;

  // Figma colors
  // App colors
  List<Color> get backgroundGradient => [
        const Color(0xFF31294F),
        const Color(0xFF1C2023),
      ];

  Color get mainGrayColor => const Color(0xFFA9A8B3);

  Color get iconGrayColor => const Color(0xff252a2e99);

  // Loading Colors
  List<Color> get loadingGradient => [
        const Color(0xFF7442FF),
        const Color(0xFF29C4F5),
      ];
  Color get loadingGrayColor => const Color(0xffA9A8B3);

  // AlertDialog
  Color get alertDialogBg => const Color(0xFF1C2023);
  Color get alertDialogBg2 => const Color.fromARGB(255, 51, 58, 63);

  // Home color
  Color get homeBgColor => const Color(0xFF0C0E0F);

  List<Color> get homeTabGradient => [
        const Color(0xFF262829),
        const Color(0xFF0E1213),
      ];

  List<Color> get homeTabIsBuyType => [
        const Color.fromARGB(255, 86, 72, 136),
        const Color.fromARGB(255, 45, 51, 56),
      ];
  Color get homeSeparate => const Color(0xFF303234);
  Color get actionsTabs => const Color(0xFF686A6B);

  Color get appBg => const Color(0xFF1F2428);
  Color get appText => const Color(0xFF747779);
  Color get cardButtonText => const Color(0xFF907AFF);

  Color get homeCardBg => const Color(0xFF22272B);
  Color get homeCardHoverBg => const Color(0xFF181A1D);

  Color get borderColor => const Color(0xFF292A43);
}
