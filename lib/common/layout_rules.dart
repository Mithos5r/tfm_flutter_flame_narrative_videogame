import 'screen_size_support.dart';
export 'package:arrugas/common/screen_size_support.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

mixin LayoutRules {
  ScreenSizeSupport obtainLayoutJumps({required MediaQueryData mediaQuery}) {
    if (kIsWeb) {
      return ScreenSizeSupport.obtainSizeByBreakPoint(
        side: mediaQuery.size.shortestSide,
      );
    }

    return ScreenSizeSupport.obtainSizeByBreakPoint(
      side: mediaQuery.orientation == Orientation.landscape
          ? mediaQuery.size.width
          : mediaQuery.size.height,
    );
  }
}
