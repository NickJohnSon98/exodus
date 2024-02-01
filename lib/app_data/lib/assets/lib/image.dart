import 'package:flutter/material.dart';

class ImageCollection {
  final String _defaultPath = 'assets/';

  String _name(String name) => _defaultPath + name;

  // Example

  Image welcome({double? width, double? height, BoxFit? fit}) => Image.asset(
        _name('layouts/welcome.png'),
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
      );

  Image crypto({String? value, double? width, double? height, BoxFit? fit}) =>
      Image.asset(
        _name('crypto/$value.png'),
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
      );
}
