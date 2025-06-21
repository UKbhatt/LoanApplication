import 'dart:async';

import 'package:creditsea/components/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class PermissionScreen extends StatefulWidget {
  const PermissionScreen({super.key});

  @override
  State<PermissionScreen> createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CreaditSea(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Permission',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Allow access to unlock a faster & personalized CreditSea experience!',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        color: const Color.fromRGBO(0, 117, 255, 0.04),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 30,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.camera_alt_outlined,
                                    color: Colors.black87,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "Camera",
                                    style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "We require access to your camera capture and upload a selfie for completing your KYC process. This allows us to verify your identity securely and protect your account from unauthorized access.",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Colors.black45,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: const Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "Location",
                                    style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "We access your location to check the servicebility of your loan application & for risk assessment. Your data is sent to our servers for processing and generating the best credit offer for you. Your data is always handled with utmost privacy & never shared with third parties without your explicit permission.",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
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
                      Navigator.pushNamed(context, '/register');
                    });
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Allow Permissions",
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
