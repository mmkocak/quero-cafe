import 'package:flutter/material.dart';
import 'package:quero_cafe/core/cubit/locale/locale_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quero_cafe/generated/l10n.dart';
import 'package:quero_cafe/view/widgets/enter_button.dart';
import 'package:quero_cafe/view/widgets/text_form_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    const String queropng = "assets/images/quero_logo.png";
    return Scaffold(
      body: Stack(children: [
        Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(color: Color(0xFFF1D4B6)),
                child: Image(
                  width: screenWidth * 0.5,
                  image: AssetImage(queropng),
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: <Color>[Colors.black87, Colors.black],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.0, 0.5]),
                ),
                child: BlocBuilder<LocaleCubit, LocaleState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        SizedBox(height: screenHeight * 0.03),
                        Text(
                          S.of(context).login,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.08,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Sora"),
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        Form(
                            child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.03),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                S.of(context).username,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.04,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Sora"),
                              ),
                              SizedBox(
                                height: screenHeight * 0.01,
                              ),
                              TextformFieldWidget(screenWidth: screenWidth),
                              SizedBox(
                                height: screenHeight * 0.03,
                              ),
                              Text(
                                S.of(context).password,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.04,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Sora"),
                              ),
                              SizedBox(
                                height: screenHeight * 0.01,
                              ),
                              TextformFieldWidget(screenWidth: screenWidth),
                              SizedBox(
                                height: screenHeight * 0.04,
                              ),
                              EnterButton(screenWidth: screenWidth, screenHeight: screenHeight),
                              SizedBox(height: screenHeight * 0.03),
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .center, 
                                children: [
                                  Text(
                                    S.of(context).Dont_have_an_account_yet,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenWidth * 0.03,
                                      fontFamily: "Sora",
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  TextButton(
                                    onPressed: () {
                                      // Navigate to signup screen
                                      // Example: Navigator.pushNamed(context, '/signup');
                                    },
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      minimumSize: Size(50, 30),
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    child: Text(
                                      S.of(context).sign_up,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: screenWidth * 0.03,
                                        fontFamily: "Sora",
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ))
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}



