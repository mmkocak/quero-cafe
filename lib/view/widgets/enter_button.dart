import 'package:flutter/material.dart';
import 'package:quero_cafe/generated/l10n.dart';

class EnterButton extends StatelessWidget {
  const EnterButton({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    this.onPressed,
  });

  final double screenWidth;
  final double screenHeight;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(16.0),
      child: InkWell(
       
          onTap:  onPressed,
        
        child: Container(
          width: screenWidth * 0.9,
          height: screenHeight * 0.08,
          decoration: BoxDecoration(
            color: Color(0xFFB17445),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Center(
            child: Text(
              S.of(context).enter,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Sora"),
            ),
          ),
        ),
      ),
    );
  }
}
