/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesHubsGen get hubs => const $AssetsImagesHubsGen();

  /// File path: assets/images/klondike-sprites.png
  AssetGenImage get klondikeSprites =>
      const AssetGenImage('assets/images/klondike-sprites.png');

  $AssetsImagesLogosGen get logos => const $AssetsImagesLogosGen();

  /// List of all assets
  List<AssetGenImage> get values => [klondikeSprites];
}

class $AssetsMusicGen {
  const $AssetsMusicGen();

  /// File path: assets/music/intro.mp3
  String get intro => 'assets/music/intro.mp3';

  /// List of all assets
  List<String> get values => [intro];
}

class $AssetsImagesHubsGen {
  const $AssetsImagesHubsGen();

  /// File path: assets/images/hubs/entrance.png
  AssetGenImage get entrance =>
      const AssetGenImage('assets/images/hubs/entrance.png');

  /// List of all assets
  List<AssetGenImage> get values => [entrance];
}

class $AssetsImagesLogosGen {
  const $AssetsImagesLogosGen();

  /// File path: assets/images/logos/arrugas.png
  AssetGenImage get arrugas =>
      const AssetGenImage('assets/images/logos/arrugas.png');

  /// File path: assets/images/logos/personaje.png
  AssetGenImage get personaje =>
      const AssetGenImage('assets/images/logos/personaje.png');

  /// List of all assets
  List<AssetGenImage> get values => [arrugas, personaje];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsMusicGen music = $AssetsMusicGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
