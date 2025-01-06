import 'package:flutter/material.dart';
import 'package:quero_cafe/generated/l10n.dart';

mixin PasswordValidationMixin {
  void showAlertDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.black,
        title: Text(S.of(context).warning, style: const TextStyle(color: Colors.white)),
        content: Text(message, style: const TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              S.of(context).ok,
              style: const TextStyle(color: Color(0xFFB17445)),
            ),
          ),
        ],
      ),
    );
  }

  String? validatePassword(BuildContext context, String password) {
    if (password.isEmpty) {
      return S.of(context).please_enter_a_password;
    }
    if (password.length < 6) {
      showAlertDialog(context, S.of(context).password_too_short);
      return S.of(context).password_too_short;
    }
    if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&_])[A-Za-z\d@$!%*?&_]{6,}$')
        .hasMatch(password)) {
      showAlertDialog(
          context, "${S.of(context).password_invalid} ${S.of(context).password_type}");
      return S.of(context).password_invalid;
    }
    return null;
  }

  String? validateRepeatPassword(BuildContext context, String repeatPassword, String password) {
    if (repeatPassword.isEmpty) {
      return S.of(context).please_enter_the_password_again;
    }
    if (password != repeatPassword) {
      return S.of(context).passwords_do_not_match;
    }
    return null;
  }
} 