import 'package:flutter/material.dart';
import 'package:toy_club_app/core/widgets/curved_adges.dart';


class TCurvedEdgetWidget extends StatelessWidget {
  const TCurvedEdgetWidget({
    super.key,
    required this.w,
    required this.h,required this.child,
  });

  final double w;
  final double h;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TCustomCurvedEdges(),
      child: child,
    );
  }
}
