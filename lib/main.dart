import 'package:creditsea/screen/ApprovalOffer.dart';
import 'package:creditsea/screen/KycLocked.dart';
import 'package:creditsea/screen/bankStatementUpload.dart';
import 'package:creditsea/screen/confirmOtp.dart';
import 'package:creditsea/screen/faceVerification.dart';
import 'package:creditsea/screen/ifSalaried.dart';
import 'package:creditsea/screen/loanProcessing.dart';
import 'package:creditsea/screen/offerApproved.dart';
import 'package:creditsea/screen/offerLoading.dart';
import 'package:creditsea/screen/otpVerification.dart';
import 'package:creditsea/screen/otp_auth.dart';
import 'package:creditsea/screen/permission_screen.dart';
import 'package:creditsea/screen/referanceDeatails.dart';
import 'package:creditsea/screen/registerUser.dart';
import 'package:creditsea/screen/success.dart';
import 'package:creditsea/screen/success2.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        GetPage(name: '/otpVerification', page: () => OtpverificationScreeen()),
        GetPage(
          name: '/bankStatementUpload',
          page: () => BankstatementuploadScreen(),
        ),
        GetPage(name: '/success', page: () => SuccessScreen()),
        GetPage(name: '/offerLoading', page: () => OfferloadingScreen()),
        GetPage(name: '/approvedOffer', page: () => ApprovedOfferScreen()),
        GetPage(name: '/kycScreen', page: () => KYClockedScreen()),
        GetPage(name: '/faceVerification', page: () => FaceVerificationScreen()),
        GetPage(name: '/success2', page: () => SuccessScreen2()),
        GetPage(name: '/referenceDetail', page: () => ReferenceAndFamilyDetailsScreen()),
        GetPage(name: '/loanprocessing', page: () => LoanprocessingScreen()),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
    );
  }
}
