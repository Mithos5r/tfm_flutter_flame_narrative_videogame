import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';

class HallExplanation extends StatelessWidget {
  const HallExplanation({
    required this.television,
    required this.canteen,
    required this.library,
    super.key,
  });

  final String? television;
  final String? canteen;
  final String? library;

  static const String requestExplanation = '???';

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: SafeArea(
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Assets.images.games.episode2.hall.provider(),
            ),
          ),
          child: const Stack(
            children: [],
          ),
        ),
      ),
    );
  }
}
