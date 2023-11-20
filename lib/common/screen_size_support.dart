enum ScreenSizeSupport {
  small(600),
  medium(950),
  large(double.infinity),
  ;

  const ScreenSizeSupport(this.breakPoint);
  final num breakPoint;

  static ScreenSizeSupport obtainSizeByBreakPoint({required double side}) {
    if (side <= small.breakPoint) {
      return small;
    }
    if (side <= medium.breakPoint) {
      return medium;
    }
    return large;
  }

  T resolve<T>({
    required T Function() onSmall,
    required T Function() onMedium,
    required T Function() onLarge,
  }) {
    return switch (this) {
      ScreenSizeSupport.small => onSmall.call(),
      ScreenSizeSupport.medium => onMedium.call(),
      ScreenSizeSupport.large => onLarge.call(),
    };
  }
}
