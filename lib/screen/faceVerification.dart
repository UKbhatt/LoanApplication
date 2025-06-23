import 'dart:io';
import 'package:creditsea/components/camera_capture_widget.dart';
import 'package:creditsea/components/simpleAppbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FaceVerificationScreen extends StatefulWidget {
  const FaceVerificationScreen({super.key});

  @override
  State<FaceVerificationScreen> createState() => _FaceVerificationScreenState();
}

class _FaceVerificationScreenState extends State<FaceVerificationScreen> {
  bool showTips = true;
  File? capturedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CreditSeaSimple(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SizedBox(
          height: 48,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              setState(() => showTips = false);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  "Next",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward, color: Colors.white, size: 18),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          AnimatedSlide(
            offset: showTips ? Offset.zero : const Offset(-1, 0),
            duration: const Duration(milliseconds: 300),
            child: buildTipsScreen(),
          ),
          AnimatedSlide(
            offset: showTips ? const Offset(1, 0) : Offset.zero,
            duration: const Duration(milliseconds: 300),
            child: buildCameraScreen(),
          ),
        ],
      ),
    );
  }

  Widget buildTipsScreen() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          const SizedBox(height: 20),
          Text(
            "Let’s match your face to your Aadhaar",
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "A quick selfie for smooth verification.",
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 20),
          ...[
            "✅ Keep your face centered & clearly visible",
            "✅ Make sure you’re in a well-lit area",
            "✅ Use a neutral expression",
            "❌ Avoid masks, sunglasses, or hats",
            "❌ Don’t blur or tilt the camera",
          ].map((tip) => buildTip(tip)).toList(),
        ],
      ),
    );
  }

  Widget buildTip(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0x070075FF),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget buildCapturedImagePreview() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Here is your captured selfie",
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.file(
              capturedImage!,
              height: 350,
              width: MediaQuery.of(context).size.width * 0.85,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                capturedImage = null;
              });
            },
            icon: const Icon(Icons.camera_alt),
            label: const Text("Retake"),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  void _showVerifySelfieModal(File imageFile) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Please verify your selfie",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Make sure your face is clearly visible and well-lit before proceeding.",
                style: GoogleFonts.poppins(fontSize: 13),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {
                          capturedImage = null;
                        });
                      },
                      child: const Text("Retake"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _showKycModal();
                      },
                      child: const Text("Confirm"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _showKycModal() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Please submit your KYC",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "🔒 Your selfie is used only for one-time verification and never stored.",
                style: GoogleFonts.poppins(fontSize: 12 , fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('KYC submitted successfully!'),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text("Submit KYC", style: GoogleFonts.poppins()),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildCameraScreen() {
    return capturedImage == null
        ? CameraCaptureWidget(
            onImageCaptured: (xfile) {
              final file = File(xfile.path);
              setState(() {
                capturedImage = file;
              });
            },
          )
        : buildCapturedImagePreview();
  }
}
