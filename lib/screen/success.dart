import 'package:creditsea/components/appbar_cross.dart';
import 'package:creditsea/statemanagement/progressGetx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  final ProgressController progressController = Get.put(ProgressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CreaditSeaX(
        onClose: () {
          progressController.goToNextStep();
          Get.offNamed("/offerLoading");
        },
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/logo/success.png"),
            const SizedBox(height: 16),
            SizedBox(height: 10),
            Text(
              "Success!",
              style: GoogleFonts.poppins(
                color: const Color(0xFF34C759),
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Bank linked and verified successfully!",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
