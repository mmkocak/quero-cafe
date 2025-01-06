import 'package:flutter/material.dart';
import 'package:quero_cafe/generated/l10n.dart';

class CustomAlertDialog extends StatelessWidget {
  final String message;

  const CustomAlertDialog({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,
      title: Text(
        S.of(context).warning,
        style: const TextStyle(color: Colors.white),
      ),
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            S.of(context).ok,
            style: const TextStyle(color: Color(0xFFB17445)),
          ),
        ),
      ],
    );
  }
} 