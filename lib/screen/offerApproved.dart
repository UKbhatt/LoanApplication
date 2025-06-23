import 'package:creditsea/components/appBar.dart';
import 'package:creditsea/components/stepProgressBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class ApprovedOfferScreen extends StatelessWidget {
  const ApprovedOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CreaditSea(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            SizedBox(width: width * 0.9, height: 70, child: StepProgressBar()),
            const SizedBox(height: 20),
            Image.asset("assets/logo/coin.png", height: 131, width: 131),
            const SizedBox(height: 20),
            Text(
              "Your approved loan is here",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Column(
              children: [
                _infoRow("Offer Amount", "Rs. 50,000"),
                _infoRow("Tenure", "90 days"),
                _infoRow("EMI", "₹17,001.11/month"),
                _infoRow("Interest Rate", "12% p.a."),
              ],
            ),
            const Spacer(),
            Text.rich(
              TextSpan(
                text: "Please review the ",
                style: GoogleFonts.poppins(fontSize: 12),
                children: [
                  TextSpan(
                    text: "Terms & Conditions",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue,
                    ),
                  ),
                  const TextSpan(text: " before accepting the offer."),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Get.offNamed("/kycScreen");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Accept",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
