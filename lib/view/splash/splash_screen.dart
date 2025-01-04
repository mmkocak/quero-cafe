import 'package:flutter/material.dart';
import 'package:quero_cafe/core/cubit/locale/locale_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quero_cafe/generated/l10n.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(color: Color(0xFFF1D4B6)),
              child: Center(
                child: Image(
                  image: AssetImage("assets/images/quero_logo.png"),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: BlocBuilder<LocaleCubit, LocaleState>(
              builder: (context, state) {
                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[Color(0xFFF1D4B6), Colors.black],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.01, 0.09],
                    ),
                  ),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
