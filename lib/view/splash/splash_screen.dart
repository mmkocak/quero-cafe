import 'package:flutter/material.dart';
import 'package:quero_cafe/core/cubit/locale/locale_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quero_cafe/generated/l10n.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
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
                    child: SizedBox(
                      width: screenWidth * 0.7,
                       child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            fontFamily: "Sora",
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.08,
                          ),
                          children: [
                            TextSpan(text: S.of(context).onboarding_description),
                            TextSpan(
                              text: S.of(context).onboarding_description_highlight,
                              style: TextStyle(
                                color: Color(0xFFC67C4E),
                              ),
                            ),
                            TextSpan(text: S.of(context).onboarding_description_part2),
                          ],
                        ),
                      ),
                    ),
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
