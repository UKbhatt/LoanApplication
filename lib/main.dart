import 'package:creditsea/screen/confirmOtp.dart';
import 'package:creditsea/screen/otp_auth.dart';
import 'package:creditsea/screen/permission_screen.dart';
import 'package:creditsea/screen/registerUser.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
       routes: {
        '/': (context) => OtpAuth(),
        '/otpConfirm': (context) => Confirmotp(),
        '/permission': (context) => PermissionScreen(),
        '/register': (context) => RegisterScreen(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
    );
  }
}
