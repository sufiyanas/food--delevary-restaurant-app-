import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delevary_admin/core/theme/theme.dart';
import 'package:food_delevary_admin/presentation/loginScreen/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

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
