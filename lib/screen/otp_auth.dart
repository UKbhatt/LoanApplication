import 'dart:async';

import 'package:creditsea/components/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpAuth extends StatefulWidget {
  const OtpAuth({super.key});

  @override
  State<OtpAuth> createState() => _OtpAuthState();
}

class _OtpAuthState extends State<OtpAuth> {
  bool isWhatsappChecked = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CreaditSea(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Verify mobile number',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Please enter your Aadhaar-linked mobile number',
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 20),

              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    const Text("+91", style: TextStyle(fontSize: 16)),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter mobile number",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              Row(
                children: [
                  Checkbox(
                    value: isWhatsappChecked,
                    activeColor: Colors.blue,
                    onChanged: (value) {
                      setState(() {
                        isWhatsappChecked = value!;
                      });
                    },
                  ),
                  const Text("Receive Whatsapp notification"),
                ],
              ),
              const Spacer(),

              RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                  children: [
                    const TextSpan(
                      text:
                          "By Clicking on the ‘Next’ button, you agree to our ",
                    ),
                    TextSpan(
                      text: "privacy policies",
                      style: const TextStyle(color: Colors.blue),
                    ),
                    const TextSpan(text: " and "),
                    TextSpan(
                      text: "Terms & Conditions",
                      style: const TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade600,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => const Center(
                        child: SpinKitCircle(color: Colors.blue),
                      ),
                    );
                    Timer(const Duration(seconds: 2), () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/otpConfirm');
                    });
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Next",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
