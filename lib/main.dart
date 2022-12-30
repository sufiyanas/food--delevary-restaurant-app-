import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delevary_admin/core/theme/theme.dart';
import 'package:food_delevary_admin/presentation/Home/home_screen.dart';
import 'package:food_delevary_admin/presentation/loginScreen/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_delevary_admin/presentation/mainpage/mainscreen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: LogInScreen(),
    );
  }
}

class Mainpage extends StatelessWidget {
  const Mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return const Center(child: Text("Something went Wrong!"));
            } else if (snapshot.hasData) {
              return MainPage();
            } else {
              return LogInScreen();
            }
          }),
    );
  }
}
