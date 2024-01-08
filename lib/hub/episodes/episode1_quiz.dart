import 'package:flutter/material.dart';

import '../widgets/actions.dart';

class Episode1Quiz extends StatelessWidget {
  const Episode1Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return ArrugasAction(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        alignment: Alignment.center,
        child: const Text('Esto es un quiz'),
      ),
    );
  }
}
