import 'dart:io';
import 'package:camera/camera.dart';
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
  CameraController? _cameraController;
  late List<CameraDescription> _cameras;
  File? capturedImage;

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  Future<void> initCamera() async {
    _cameras = await availableCameras();
    _cameraController = CameraController(_cameras[1], ResolutionPreset.medium);
    await _cameraController!.initialize();
    if (!mounted) return;
    setState(() {});
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

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

  Widget buildCameraScreen() {
    return CameraCaptureWidget(
      onImageCaptured: (imageFile) {
        print("Captured Image Path: ${imageFile.path}");
      },
    );
  }
}
