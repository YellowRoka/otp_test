import 'package:flutter/material.dart';
import 'package:otp_test/commons/constans.dart';

class HighestScoreLine extends StatelessWidget {
  final int highestPoint;

  const HighestScoreLine({super.key, required this.highestPoint });

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      width: 400,
      child: Text( "$constHighScore   $highestPoint" ),
    );
  }
}
