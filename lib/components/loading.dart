import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingAnimation extends StatelessWidget {
  final bool loading;
  final Widget child;

  const LoadingAnimation({
    required this.loading,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: loading,
      justifyMultiLineText: true,
      effect: ShimmerEffect(
        baseColor: Theme.of(context).colorScheme.secondaryContainer,
        highlightColor: Theme.of(context).colorScheme.onSecondaryContainer,
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        duration: Duration(milliseconds: 1300),
      ),
      // textBoneBorderRadius: TextBoneBorderRadius.fromHeightFactor(0.4),
      child: child,
    );
  }
}
