import 'package:flutter/material.dart';
import 'package:quero_cafe/core/cubit/locale/locale_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quero_cafe/generated/l10n.dart';

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
                  image: AssetImage("assets/images/quero_logo.png"),
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
                              SizedBox(
                                width: screenWidth * 0.9,
                                child: TextFormField(
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
                              ),
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
                              SizedBox(
                                width: screenWidth * 0.9,
                                child: TextFormField(
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
                              ),
                              SizedBox(
                                height: screenHeight * 0.04,
                              ),
                              Material(
                                borderRadius: BorderRadius.circular(16.0),
                                child: InkWell(
                                  onTap: () {
                                    debugPrint("Inkwell tıklandı");
                                  },
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
                              ),
                              SizedBox(height: screenHeight * 0.03),
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .center, // Center the content horizontally
                                children: [
                                  Text(
                                    S.of(context).Dont_have_an_account_yet,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenWidth * 0.03,
                                      fontFamily: "Sora",
                                    ),
                                  ),
                                  SizedBox(
                                      width: 8), // Add spacing between texts
                                  TextButton(
                                    onPressed: () {
                                      // Navigate to signup screen
                                      // Example: Navigator.pushNamed(context, '/signup');
                                    },
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets
                                          .zero, // Remove default padding
                                      minimumSize: Size(50,
                                          30), // Adjust min size if necessary
                                      tapTargetSize: MaterialTapTargetSize
                                          .shrinkWrap, // Reduce tap area
                                    ),
                                    child: Text(
                                      S.of(context).sign_up,
                                      style: TextStyle(
                                        color: Colors
                                            .white, // Or a different color for the button text
                                        fontSize: screenWidth * 0.03,

                                        fontFamily: "Sora",
                                        decoration: TextDecoration
                                            .underline, //Optional: Underline the signup text
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
