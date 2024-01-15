import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class ArrugasImage {
  const ArrugasImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    if (kIsWeb) {
      return _networkImage(
        key,
        frameBuilder,
        errorBuilder,
        semanticLabel,
        excludeFromSemantics,
        width,
        height,
        color,
        opacity,
        colorBlendMode,
        fit,
        alignment,
        repeat,
        centerSlice,
        matchTextDirection,
        gaplessPlayback,
        isAntiAlias,
        filterQuality,
        cacheWidth,
        cacheHeight,
      );
    }
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  Image _networkImage(
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment,
    ImageRepeat repeat,
    Rect? centerSlice,
    bool matchTextDirection,
    bool gaplessPlayback,
    bool isAntiAlias,
    FilterQuality filterQuality,
    int? cacheWidth,
    int? cacheHeight,
  ) {
    return ArrugasNetworkImage(_assetName).network(
      key: key,
      frameBuilder: frameBuilder,
      errorBuilder: (context, error, stacktrace) =>
          ArrugasImage(_assetName).image(
        frameBuilder: frameBuilder,
        errorBuilder: errorBuilder,
        semanticLabel: semanticLabel,
        excludeFromSemantics: excludeFromSemantics,
        width: width,
        height: height,
        color: color,
        opacity: opacity,
        colorBlendMode: colorBlendMode,
        fit: fit,
        alignment: alignment,
        repeat: repeat,
        centerSlice: centerSlice,
        matchTextDirection: matchTextDirection,
        gaplessPlayback: gaplessPlayback,
        isAntiAlias: isAntiAlias,
        filterQuality: filterQuality,
        cacheWidth: cacheWidth,
        cacheHeight: cacheHeight,
      ),
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    if (kIsWeb) {
      return ArrugasNetworkImage(_assetName).provider();
    }
    return AssetImage(
      _assetName,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;

  ArrugasImage copyWith({
    String? assetName,
  }) {
    return ArrugasImage(
      assetName ?? _assetName,
    );
  }

  ArrugasImage nextImage({
    required int counter,
  }) {
    final regex = RegExp(r'view\d*\.png');
    final fileWithoutFormat = path.replaceAll(regex, '');

    return copyWith(
      assetName: "${fileWithoutFormat}view$counter.png",
    );
  }
}

class ArrugasNetworkImage {
  const ArrugasNetworkImage(this._assetName);

  final String _assetName;

  Image network({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.network(
      _assetName.networkPath,
      key: key,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() {
    return NetworkImage(
      _assetName.networkPath,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

extension _NetworkPath on String {
  String get networkPath => "assets/$this";
}
