import 'package:creditsea/screen/ApprovalOffer.dart';
import 'package:creditsea/screen/confirmOtp.dart';
import 'package:creditsea/screen/ifSalaried.dart';
import 'package:creditsea/screen/otp_auth.dart';
import 'package:creditsea/screen/permission_screen.dart';
import 'package:creditsea/screen/registerUser.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => OtpAuth()),
        GetPage(name: '/otpConfirm', page: () => Confirmotp()),
        GetPage(name: '/permission', page: () => PermissionScreen()),
        GetPage(name: '/register', page: () => RegisterScreen()),
        GetPage(name: '/approval', page: () => Approvaloffer()),
        GetPage(name: '/salaried', page: () => IfsalariedScreeen()),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
    );
  }
}
