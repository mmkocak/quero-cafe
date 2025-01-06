import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quero_cafe/core/cubit/coffee_size/coffee_size_cubit.dart';
import 'package:quero_cafe/generated/l10n.dart';

mixin CoffeeSizeButtonMixin {
  Widget buildSizeButton(BuildContext context, String size, bool isSelected) {
    String sizeText = size == 'P'
        ? S.of(context).small
        : size == 'M'
            ? S.of(context).medium
            : S.of(context).large;

    return GestureDetector(
      onTap: () => context.read<CoffeeSizeCubit>().selectSize(size),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFB17445) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color(0xFFB17445),
            width: 1,
          ),
        ),
        child: Text(
          sizeText,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFFB17445),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
} 