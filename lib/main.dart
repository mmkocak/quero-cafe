import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:quero_cafe/core/cubit/authentication/authentication_cubit.dart';
import 'package:quero_cafe/core/cubit/locale/locale_cubit.dart';
import 'package:quero_cafe/firebase_options.dart';
import 'package:quero_cafe/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quero_cafe/core/cubit/navigation/navigation_cubit.dart';
import 'package:quero_cafe/view/mixins/build_initial_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: 'key.env');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  final authCubit = AuthenticationCubit();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LocaleCubit()),
        BlocProvider.value(value: authCubit),
        BlocProvider(create: (context) => NavigationCubit()),
      ],
      child: MyApp(),
    ));
  });
}

class MyApp extends StatelessWidget {
  final _buildInitialScreen = BuildInitialScreen();
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthState>(
      builder: (context, authState) {
        return BlocBuilder<LocaleCubit, LocaleState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              locale: state.locale,
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              title: 'Quero Cafe',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: _buildInitialScreen.buildInitialScreen(authState),
            );
          },
        );
      },
    );
  }
}
