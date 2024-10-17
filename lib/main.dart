import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'core/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';

import 'features/expert/users/presentation/pages/analysis_workout_screen.dart';
import 'features/expert/users/presentation/pages/users_screen.dart';
import 'features/main_features/presentation/pages/login.dart';
import 'features/user/home/presentation/pages/home_screen.dart';
import 'features/user/userManagement/presentation/pages/sing_up.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('==================User is currently signed out!');
      } else {
        print('===================User is signed in!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      routes: {
        'AnalysisWorkoutScreen': (context) => AnalysisWorkoutScreen(),
        'singUp': (context) => CreateAccountScreen(),
        'Home': (context) => HomeScreen(),
        'UsersScreen' :(context) => UsersScreen(),
      },
    );
  }
}
