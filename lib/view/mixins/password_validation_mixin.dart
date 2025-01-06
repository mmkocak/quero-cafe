import 'package:flutter/material.dart';
import 'package:quero_cafe/generated/l10n.dart';

mixin PasswordValidationMixin {
  String? validatePassword(BuildContext context, String password) {
    if (password.isEmpty) {
      return S.of(context).please_enter_a_password;
    }
    if (password.length < 6) {
      return S.of(context).password_too_short;
    }
    if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&_])[A-Za-z\d@$!%*?&_]{6,}$')
        .hasMatch(password)) {
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