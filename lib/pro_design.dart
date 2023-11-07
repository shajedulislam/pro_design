library pro_design;

import 'package:flutter/material.dart';

import 'enums.dart';
import 'font_responsiveness.dart';
import 'values.dart';

///ProDesign will help you making responsive application in many ways!
class ProDesign {
  static bool _init = false;
  static late double _adjustor;
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double _blockSizeHorizontal;
  static late double _blockSizeVertical;
  static ProDeviceType? deviceType;
  static Orientation? orientation;

  ///returns device type based on screen width
  static ProDeviceType getDeviceType() {
    if (screenWidth <= 480) {
      return ProDeviceType.mobile;
    } else if (screenWidth > 480 && screenWidth <= 1024) {
      return ProDeviceType.tablet;
    } else {
      return ProDeviceType.desktop;
    }
  }

  ///For responsiveness you can use this function by passing how much screen portion you want to use in horizontal (X) axis in the range of `0% - 100%`.
  static double horizontally(double blocks) {
    assert(
      _init,
      "\nYou must call ProDesign.init() and pass context in a Widget build function and it should be inside MaterialApp, Not Before MaterialApp.\n",
    );
    return _blockSizeHorizontal * blocks;
  }

  ///For responsiveness you can use this function by passing how much screen portion you want to use in vertical (Y) axis in the range of `0% - 100%`.
  static double vertically(double blocks) {
    assert(
      _init,
      "\nYou must call ProDesign.init() and pass context in a Widget build function and it should be inside MaterialApp, Not Before MaterialApp.\n",
    );
    return _blockSizeVertical * blocks;
  }

  ///Flutter does not have exact solution to use point or pt values for responsiveness but we tried to make one and it works nice. You can try out by passing point or pt values.
  static double pt(double pt) {
    assert(
      _init,
      "\nYou must call ProDesign.init() and pass context in a Widget build() function and it should be inside a MaterialApp, Not Before MaterialApp.\n",
    );
    if (deviceType == ProDeviceType.mobile) {
      return _blockSizeHorizontal * pt * _adjustor;
    } else {
      return pt;
    }
  }

  /// To make responsive font size, use this function
  static double sp(double size) {
    assert(
      _init,
      "\nYou must call ProDesign.init() and pass context in a Widget build() function and it should be inside MaterialApp, Not Before MaterialApp.\n",
    );
    if (deviceType == ProDeviceType.mobile) {
      return ProFontResponsiveness().setSp(size);
    } else {
      return size;
    }
  }

  /// You must call this function in a [ Widget build ] function and it should be inside [ MaterialApp ]. Not Before [ MaterialApp ].
  /// You have to pass context here.
  /// Additionally you can pass adjustor value that will help to change the responsiveness ratio. Note: Default value is 0.277. Do not pass any value without understanding how it works.
  static void init(BuildContext context, {double? adjustor}) {
    _init = true;
    _adjustor = adjustor ?? 0.277;
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    _blockSizeHorizontal = screenWidth / 100;
    _blockSizeVertical = screenHeight / 100;
    orientation = _mediaQueryData.orientation;

    // print(screenWidth);
    // print(screenHeight);
    // print(orientation);

    if (screenWidth <= 480) {
      deviceType = ProDeviceType.mobile;
    } else if (screenWidth > 480 && screenWidth <= 1024) {
      deviceType = ProDeviceType.tablet;
    } else {
      deviceType = ProDeviceType.desktop;
    }

    // print(deviceType);

    late double defaultScreenWidth;
    late double defaultScreenHeight;

    if (deviceType == ProDeviceType.mobile) {
      defaultScreenWidth = ProScreenSizes.mobileWidth;
      defaultScreenHeight = ProScreenSizes.mobileHeight;
    } else {
      defaultScreenWidth = ProScreenSizes.tabletWidth;
      defaultScreenHeight = ProScreenSizes.tabletHeight;
    }

    ProFontResponsiveness.init(
      context,
      designSize: Size(defaultScreenWidth, defaultScreenHeight),
    );
  }
}
