import 'package:flutter/material.dart' show Colors, Feedback;
import 'package:flutter/widgets.dart';

@immutable
class ArrugasAction extends StatefulWidget {
  const ArrugasAction({
    required this.child,
    required this.onTap,
    super.key,
    this.canRequestFocus = true,
  });

  factory ArrugasAction.fromIcon({
    required VoidCallback onTap,
    required IconData icon,
    required EdgeInsetsGeometry padding,
    Color? backgroundColor,
  }) =>
      ArrugasAction(
        onTap: onTap,
        child: Padding(
          padding: padding,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: backgroundColor = Colors.grey.shade200,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Icon(icon),
            ),
          ),
        ),
      );

  final Widget child;
  final bool canRequestFocus;
  final VoidCallback onTap;

  @override
  State<ArrugasAction> createState() => _ArrugasActionState();
}

class _ArrugasActionState extends State<ArrugasAction> {
  double opacity = 1;
  @override
  Widget build(BuildContext context) {
    return Focus(
      canRequestFocus: widget.canRequestFocus,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Semantics(
          onTap: () async {
            setState(() {
              opacity = 0.4;
            });
            final feedback = Feedback.forTap(context);
            widget.onTap.call();
            await feedback;
            if (mounted) {
              setState(() {
                opacity = 1;
              });
            }
          },
          child: GestureDetector(
            onTapDown: (_) {
              if (mounted) {
                setState(() {
                  opacity = 0.4;
                });
              }
            },
            onTapCancel: () {
              if (mounted && opacity != 1) {
                setState(() {
                  opacity = 1;
                });
              }
            },
            onTapUp: (_) {
              if (mounted && opacity != 1) {
                setState(() {
                  opacity = 1;
                });
              }
            },
            onTap: Feedback.wrapForTap(widget.onTap, context),
            excludeFromSemantics: true,
            behavior: HitTestBehavior.opaque,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: opacity,
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
