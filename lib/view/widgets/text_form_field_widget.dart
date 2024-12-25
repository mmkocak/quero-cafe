import 'package:flutter/material.dart';

class TextformFieldWidget extends StatelessWidget {
  const TextformFieldWidget({
    super.key,
    required this.screenWidth,
     this.controller
  });

  final double screenWidth;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth * 0.9,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFF6C6C6C),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}