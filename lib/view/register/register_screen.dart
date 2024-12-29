import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quero_cafe/core/cubit/authentication/authentication_cubit.dart';
import 'package:quero_cafe/generated/l10n.dart';
import 'package:quero_cafe/view/widgets/enter_button.dart';
import 'package:quero_cafe/view/widgets/text_form_field_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _usernameController = TextEditingController();
  late TextEditingController _emailController = TextEditingController();
  late TextEditingController _passwordController = TextEditingController();
  late TextEditingController _repeatPasswordController =
      TextEditingController();

  void _showAlertDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.black,
        title:
            Text(S.of(context).warning, style: TextStyle(color: Colors.white)),
        content: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              S.of(context).ok,
              style: TextStyle(color: Color(0xFFB17445)),
            ),
          ),
        ],
      ),
    );
  }

  String? _validatePassword(String password) {
    if (password.isEmpty) {
      return S.of(context).please_enter_a_password;
    }
    if (password.length < 6) {
      _showAlertDialog(S.of(context).password_too_short.toString());
      return S.of(context).password_too_short;
    }
    if (!RegExp(
            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&_])[A-Za-z\d@$!%*?&_]{6,}$')
        .hasMatch(password)) {
      _showAlertDialog(
          "${S.of(context).password_invalid.toString()} ${S.of(context).password_type.toString()}");
      return S.of(context).password_invalid;
    }

    return null;
  }

  String? _validateRepeatPassword(String repeatPassword, String password) {
    if (repeatPassword.isEmpty) {
      return S.of(context).please_enter_the_password_again;
    }

    if (password != repeatPassword) {
      return S.of(context).passwords_do_not_match;
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _repeatPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocListener<AuthenticationCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/home',
              (route) => false,
            );
          } else if (state is AuthFailure) {
            _showAlertDialog(state.error);
          }
        },
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenHeight * 0.15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).register,
                      style: TextStyle(
                          fontFamily: "Sora",
                          fontSize: screenWidth * 0.07,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
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
                      TextformFieldWidget(
                          controller: _usernameController,
                          screenWidth: screenWidth),
                      SizedBox(
                        height: screenHeight * 0.04,
                      ),
                      // Password
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
                      TextformFieldWidget(
                          validator: (value) => _validatePassword(value!),
                          obscureText: true,
                          controller: _passwordController,
                          screenWidth: screenWidth),
                      SizedBox(
                        height: screenHeight * 0.04,
                      ),
                      // Repeat password
                      Text(
                        S.of(context).repeat_password,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Sora"),
                      ),
                      SizedBox(
                        height: screenHeight * 0.01,
                      ),
                      TextformFieldWidget(
                        validator: (value) => _validateRepeatPassword(
                            value!, _passwordController.text),
                        obscureText: true,
                        controller: _repeatPasswordController,
                        screenWidth: screenWidth,
                      ),

                      SizedBox(
                        height: screenHeight * 0.04,
                      ),
                      //email
                      Text(
                        S.of(context).e_mail,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Sora"),
                      ),
                      SizedBox(
                        height: screenHeight * 0.01,
                      ),
                      TextformFieldWidget(
                          controller: _emailController,
                          screenWidth: screenWidth),
                      SizedBox(
                        height: screenHeight * 0.04,
                      ),
                      EnterButton(
                          onPressed: () {
                            if (_passwordController.text.isEmpty ||
                                _emailController.text.isEmpty ||
                                _usernameController.text.isEmpty) {
                              _showAlertDialog(
                                  S.of(context).fill_in_all_fields.toString());
                            } else {
                              if (_formKey.currentState!.validate()) {
                                final username =
                                    _usernameController.text.trim();
                                final email = _emailController.text.trim();
                                final password =
                                    _passwordController.text.trim();
                                context
                                    .read<AuthenticationCubit>()
                                    .registerUser(username, email, password);
                              }
                            }
                          },
                          screenWidth: screenWidth,
                          screenHeight: screenHeight),
                      SizedBox(
                        height: screenHeight * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            S.of(context).I_already_have_an_account,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.03,
                              fontFamily: "Sora",
                            ),
                          ),
                          SizedBox(width: 8),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size(50, 30),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              S.of(context).Access,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
