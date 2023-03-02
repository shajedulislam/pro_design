import 'package:flutter/material.dart';

class ProFontResponsiveness {
  static ProFontResponsiveness? _instance;
  static const Size defaultSize = Size(1080, 1920);

  /// Size of the phone in UI Design , px
  Size uiSize = defaultSize;

  /// allowFontScaling Specifies whether fonts should scale to respect Text Size accessibility settings. The default is false.
  bool allowFontScaling = false;

  static late double _screenWidth;

  ProFontResponsiveness._();

  factory ProFontResponsiveness() {
    assert(
      _instance != null,
      '\nYou must call ProDesign.init() and pass context in a Widget build function and it should be inside MaterialApp, Not Before MaterialApp.',
    );
    return _instance!;
  }

  static void init(
    BuildContext context, {
    Size designSize = defaultSize,
  }) {
    _instance ??= ProFontResponsiveness._();
    _instance!.uiSize = designSize;

    MediaQueryData mediaQuery = MediaQuery.of(context);

    _screenWidth = mediaQuery.size.width;
  }

  ///Font size adaptation method in px
  double setSp(num fontSize) => fontSize * (_screenWidth / uiSize.width);
}
