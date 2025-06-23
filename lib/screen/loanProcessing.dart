import 'package:creditsea/components/appBar.dart';
import 'package:creditsea/components/stepProgressBar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoanprocessingScreen extends StatefulWidget {
  const LoanprocessingScreen({super.key});

  @override
  State<LoanprocessingScreen> createState() => _LoanprocessingScreenState();
}

class _LoanprocessingScreenState extends State<LoanprocessingScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CreaditSea(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                height: 70,
                width: width * 0.9,
                child: StepProgressBar(),
              ),
            ),
            Image.asset("assets/logo/skyWait.png"),
            const SizedBox(height: 16),
            Text(
              "Great news!",
              textAlign: TextAlign.center, 
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Your loan will be disbursed by the end of the day",
              textAlign: TextAlign.center, 
              style: GoogleFonts.poppins(
                color: Colors.blue,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "For any queries or assistance, feel free to reach out to us at 9240256650",
              textAlign: TextAlign.center, 
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "(Monday to Saturday, 11:00 AM – 7:00 PM)",
              textAlign: TextAlign.center, 
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),

    );
  }
}
