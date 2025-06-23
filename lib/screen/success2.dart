import 'package:creditsea/components/appbar_cross.dart';
import 'package:creditsea/components/stepProgressBar.dart';
import 'package:creditsea/statemanagement/progressGetx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessScreen2 extends StatefulWidget {
  const SuccessScreen2({super.key});

  @override
  State<SuccessScreen2> createState() => _SuccessScreen2State();
}

class _SuccessScreen2State extends State<SuccessScreen2> {
  final ProgressController progressController = Get.put(ProgressController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width; 
    return Scaffold(
      appBar: CreaditSeaX(
        onClose: () {
          progressController.goToNextStep();
          Get.toNamed("/referenceDetail");
        },
      ),
      body: Center(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                height: 70,
                width: width * 0.9,
                child: StepProgressBar(),
              ),
            ),
            Column(
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
                  "Face KYC Submitted Successfully!",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
