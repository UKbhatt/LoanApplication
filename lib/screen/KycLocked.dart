import 'package:creditsea/components/appbar_cross.dart';
import 'package:creditsea/components/stepProgressBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class KYClockedScreen extends StatefulWidget {
  const KYClockedScreen({super.key});

  @override
  State<KYClockedScreen> createState() => _KyclockedScreenState();
}

class _KyclockedScreenState extends State<KYClockedScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CreaditSeaX(
        onClose: () {
          Get.toNamed("/faceVerification");
        },
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: SizedBox(
                height: 50,
                width: width * 0.9,
                child: StepProgressBar(),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/logo/gift.png",
                    width: width * 0.6,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Offer locked in",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Let's get your KYC done",  
                  style: GoogleFonts.poppins(
                    fontSize: 14,  
                    fontWeight: FontWeight.w500
                  ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
