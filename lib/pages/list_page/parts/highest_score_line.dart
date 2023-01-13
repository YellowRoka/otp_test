import 'package:flutter/material.dart';

class HighestScoreLine extends StatelessWidget {
  final int highestPoint;

  const HighestScoreLine({super.key, required this.highestPoint });

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      width: 400,
      child: Text( "Highest Score:   $highestPoint" ),
    );
  }
}
