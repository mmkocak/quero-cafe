import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quero_cafe/core/cubit/authentication/authentication_cubit.dart';
import 'package:quero_cafe/generated/l10n.dart';
import 'package:quero_cafe/view/widgets/enter_button.dart';
import 'package:quero_cafe/view/widgets/text_form_field_widget.dart';
import 'package:quero_cafe/view/mixins/password_validation_mixin.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with PasswordValidationMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController = TextEditingController();

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
            showAlertDialog(context, state.error);
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
                          validator: (value) => validatePassword(context, value!),
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
                        validator: (value) => validateRepeatPassword(
                          context,
                          value!,
                          _passwordController.text,
                        ),
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
                              showAlertDialog(
                                  context, S.of(context).fill_in_all_fields);
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
