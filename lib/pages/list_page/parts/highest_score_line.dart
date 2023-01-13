import 'package:flutter/material.dart';

class HighestScoreLine extends StatelessWidget {
  final int highestPoint;

  const HighestScoreLine({super.key, required this.highestPoint });

  @override
  Widget build(BuildContext context) {
    
    return Row(
      children: [
        const Text( "Highest Score:" ),
        const SizedBox( width: 10 ),
        Text( "$highestPoint" ),
      ],
    );
  }
}
