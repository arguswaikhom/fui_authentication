import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fui_authentication/sign_up_user_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    return MaterialApp(
      title: 'FUI Authentication',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignUpUserPage(),
    );
  }
}
