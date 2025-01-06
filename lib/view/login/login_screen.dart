import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quero_cafe/core/cubit/locale/locale_cubit.dart';
import 'package:quero_cafe/generated/l10n.dart';
import 'package:quero_cafe/view/mixins/password_validation_mixin.dart';
import 'package:quero_cafe/view/widgets/enter_button.dart';
import 'package:quero_cafe/view/widgets/text_form_field_widget.dart';
import 'package:quero_cafe/core/cubit/authentication/authentication_cubit.dart';
import 'package:quero_cafe/view/widgets/custom_alert_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with PasswordValidationMixin {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void showAlertDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(message: message),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    const String queropng = "assets/images/quero_logo.png";

    return Scaffold(
      body: BlocListener<AuthenticationCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/home',
              (route) => false,
            );
          } else if (state is AuthFailure) {
            showAlertDialog(state.error);
          }
        },
        child: Stack(
          children: [
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
                        stops: [0.0, 0.5],
                      ),
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
                                fontFamily: "Sora",
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.03),
                            Form(
                              key: _formKey,
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
                                        fontFamily: "Sora",
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.01,
                                    ),
                                    TextformFieldWidget(
                                      controller: _usernameController,
                                      screenWidth: screenWidth,
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
                                        fontFamily: "Sora",
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.01,
                                    ),
                                    TextformFieldWidget(
                                      controller: _passwordController,
                                      screenWidth: screenWidth,
                                      obscureText: true,
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.04,
                                    ),
                                    EnterButton(
                                      screenWidth: screenWidth,
                                      screenHeight: screenHeight,
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          context
                                              .read<AuthenticationCubit>()
                                              .loginUser(
                                                _usernameController.text.trim(),
                                                _passwordController.text.trim(),
                                              );
                                        }
                                      },
                                    ),
                                    SizedBox(height: screenHeight * 0.03),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          S
                                              .of(context)
                                              .Dont_have_an_account_yet,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: screenWidth * 0.03,
                                            fontFamily: "Sora",
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, '/register');
                                          },
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.zero,
                                            minimumSize: Size(50, 30),
                                            tapTargetSize: MaterialTapTargetSize
                                                .shrinkWrap,
                                          ),
                                          child: Text(
                                            S.of(context).sign_up,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: screenWidth * 0.03,
                                              fontFamily: "Sora",
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
